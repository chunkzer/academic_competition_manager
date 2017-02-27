require 'bcrypt'
class User < ActiveRecord::Base
  enum role_id: [:zero, :student, :admin, :super_admin, :tutor]
  has_many   :event_subscriptions
  has_many   :documents

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

end
