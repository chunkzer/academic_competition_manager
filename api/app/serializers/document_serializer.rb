class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :path, :user_id, :event_id, :state, :requirement, :image, :event

  def requirement
    object.requirement.description
  end

  def event
    object.event.name
  end

  def image
    object.path.file unless object.path.nil?
  end
end
