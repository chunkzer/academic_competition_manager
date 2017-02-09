class EventSubscription < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

  scope :user_is_subscriptor, ->(user) {where(user_id: user.id)}
  scope :event_is_upcoming, -> {joins(:event).where("registration_deadline > ?", Time.now)}
  scope :event_is_passed, -> {joins(:event).where("registration_deadline < ?", Time.now)}

end
