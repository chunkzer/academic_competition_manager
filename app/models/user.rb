require 'bcrypt'
class User < ActiveRecord::Base
  enum role_id: [:zero, :student, :tutor, :admin, :super_admin]
  has_many   :event_subscriptions
  has_many   :documents
  has_many   :user_notifications

  SEPARATOR = Arel::Nodes.build_quoted(' ')

  def self.concat
    Arel::Nodes::NamedFunction.new(
     'concat',[User.arel_table[:name], SEPARATOR, User.arel_table[:last_name], SEPARATOR, User.arel_table[:email]]
    )
  end

  def events
    self.event_subscriptions.map {|es| es.event}
  end

  def full_name
    "#{self.name} #{self.last_name}"
  end

  def encrypt_password
    if self.password.present?
      self.password = BCrypt::Password.create(self.password).sub!("$2a", "$2y")
    end
  end

  def approved_documents
    self.documents.where(state: Document.state[:approved])
  end

  def reject_and_unsubmitted
    self.documents.where(state: [Document.state[:approved], Document.state[:unsubmitted]])
  end

  def documents_pending_review
    self.documents.where(state: Document.state[:pending_review])
  end

  def send_tutor_status_email
    UserMailer.tutor_status_email(self).deliver_now
  end

  def self.roles
    {
      student: 1,
      tutor: 2,
      admin: 3,
      super_admin: 4
    }
  end

  def tutor_csv_report
    if self.role_id == 2
      csv_data = CSV.generate do |csv|
        csv << self.header_columns
        TutorUsers.where(tutor_id: self.id).each do |tu|
          csv << self.csv_row(tu)
        end
      end
      csv_data
    end
  end

  private
  def header_columns
    headers = []
    headers << "Correo" << "Nombre" << "Apellido" << "Eventos Registrados Sin Aprobar" << "Eventos Registrados Aprobados "
  end

  def csv_row tu
    row << tu.user.email
    if tu.user_id.present?
      @user = tu.user
      row << (@user.name ||= "No esta presente") << (@user.last_name ||= "No esta presente")
      user_events =  @user.event_subscriptions.where(approved: false).map {|es| es.event}
      future_approved = user_events.select {|e| e.event_date > Time.now }
      row << future_approved.map {|fe| fe.name}

      user_events =  @user.event_subscriptions.where(approved: true).map {|es| es.event}
      future_approved = user_events.select {|e| e.event_date > Time.now }
      row << future_approved.map {|fe| fe.name}
    else
      row << "No esta presente" << "No esta presente" << "Ninguno" << "Este Usuario no ha entrado a la plataforma"
    end
  end

end
