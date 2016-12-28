class EventRequirement < ActiveRecord::Base

  belongs_to :event
  belongs_to :requirement, foreign_key: "requirement_id"

end
