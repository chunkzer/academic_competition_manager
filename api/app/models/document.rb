class Document < ActiveRecord::Base
  enum state: [:unsubmitted, :pending_review, :approved, :rejected]

  belongs_to :user
  belongs_to :requirement, foreign_key: "requirement_id"

  mount_base64_uploader :path, PathUploader

  def self.event_subscription
    EventSubscription.where(event_id: self.event_id).where(user_id: self.user_id)[0]
  end

  def self.state
    {
      unsubmitted: 0,
      pending_review: 1,
      approved: 2,
      rejected: 3
    }
  end

end
