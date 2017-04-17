class EventSubscription < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

  scope :user_is_subscriptor, ->(user) {where(user_id: user.id)}
  scope :event_is_upcoming, -> {joins(:event).where("registration_deadline > ?", Time.now)}
  scope :event_is_passed, -> {joins(:event).where("registration_deadline < ?", Time.now)}

  def revise_subscription
    if self.event.requirements.empty? || self.user_requirements_status
      self.approved = true
    end
  end

  def user_requirements_status
    subscription_requirements = self.event.requirements.pluck(:id).map {|x| x.to_sym => 0}}
    user_documents_req_ids = self.user.approved_documents.pluck(:requirement_id)

    user_documents_req_id.each do |req|
      if subscription_requirements[req.to_sym].present?
        subscription_requirements[req.to_sym] += 1
      end
    end

    subscription_requirements.all? {|r| r[1] == 1}
  end

end
