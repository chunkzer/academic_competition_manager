class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_date, :registration_deadline, :description, :requirements, :users

end
