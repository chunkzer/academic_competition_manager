require 'bcrypt'
class User < ActiveRecord::Base

  has_many   :event_subscriptions
  has_many   :documents

  def full_name
    "#{self.name} #{self.last_name}"
  end

  def encrypt_password
  if self.password.present?
    self.password = BCrypt::Password.create(self.password).sub!("$2a", "$2y")
  end
end

end
