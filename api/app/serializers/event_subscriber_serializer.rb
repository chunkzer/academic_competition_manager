class EventSubscriberSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :approved, :documents

  def documents
    object.user.documents.where(event_id: object.event_id)
  end
end
