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

  def self.roles
    {
      student: 1,
      tutor: 2,
      admin: 3,
      super_admin: 4
    }
  end


end
