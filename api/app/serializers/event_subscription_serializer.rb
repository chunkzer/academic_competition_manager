class EventSubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :user, :event, :approved, :documents

  def documents
    object.user.documents.where(event_id: object.event_id).map{|f| DocumentSerializer.new(f).attributes}
  end
end
