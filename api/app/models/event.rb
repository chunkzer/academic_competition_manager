require 'csv'
class Event < ActiveRecord::Base
  validates :name, presence: true


  has_many :event_subscriptions
  has_many :event_requirements
  has_many :requirements, through: :event_requirements
  has_many :users, through: :event_subscriptions

  scope :upcoming, -> {where("registration_deadline > ?", Time.now)}
  scope :passed, -> {where("event_date < ?", Time.now)}

  def header_columns
    headers = []
    headers << "Nombre" << "Apellido" << "Correo Electronico"
    self.requirements.each do |req|
      headers << req.description
    end
    headers << "Estatus"
  end

  def csv_row es
    row = []
    row << es.user.name << es.user.last_name << es.user.email
    self.requirements.each do |req|
      doc = Document.find_by(requirement_id: req.id, user_id: es.user.id)
      if doc.blank?
        row << "Sin entrega"
      else
        case doc.state
        when Document.state[:unsubmitted]
          row << "Sin entrega"
        when Document.state[:pending_review]
          row << "Esperando revisión"
        when Document.state[:approved]
          row << "Documento Aprobado"
        when Document.state[:rejected]
          row << "Documento Rechazado"
        end
      end
    end
    row << (es.approved ? "Registro Completo" : "Registro Incompleto")
  end

  def to_csv
    csv_data = CSV.generate do |csv|
      csv << self.header_columns
      self.event_subscriptions.each do |es|
        csv << self.csv_row(es)
      end
    end
    csv_data
  end

end
