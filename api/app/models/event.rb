class Event < ActiveRecord::Base
  validates :name, presence: true


  has_many :event_subscribers
  has_many :event_requirements
  has_many :requirements, through: :event_requirements
  has_many :users, through: :event_subscribers

end
