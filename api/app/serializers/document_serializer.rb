class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :event_id
end
