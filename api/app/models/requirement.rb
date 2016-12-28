class Requirement < ActiveRecord::Base

  has_many :event_requirements
  has_many :documents

end
