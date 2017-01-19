class EventSubscription < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

  scope :user_is_subscriptor, ->(user) {where(user_id: user.id)}
  scope :event_is_upcoming, -> {includes(:event).where("event.registration_deadline > ?", Time.now).references(:event)}
  scope :event_is_passed, -> {includes(:event).where("event.event_date < ?", Time.now).references(:event)}

end
