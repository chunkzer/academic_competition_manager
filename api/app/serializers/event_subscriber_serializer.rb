class EventSubscriberSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :approved, :documents

  def documents
    Document.where(user_id: object.user_id).where(event_id: object.event_id).map{|f| Document.new(f).attributes}
  end
end
