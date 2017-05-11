class UserNotification < ActiveRecord::Base

  has_one :user

  def self.notification_dictionary
    {
      week_before: 1,
      day_before: 2,
      on_rejection: 3,
      on_subscription: 4,
      on_acceptance: 5
    }
  end
end
