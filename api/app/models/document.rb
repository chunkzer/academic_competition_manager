class Document < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  belongs_to :requirement, foreign_key: "requirement_id"

end
