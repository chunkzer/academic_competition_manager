class User < ActiveRecord::Base

  has_many   :event_subscriptions
  has_many   :documents

  def full_name
    "#{self.name} #{self.last_name}"
  end

end
