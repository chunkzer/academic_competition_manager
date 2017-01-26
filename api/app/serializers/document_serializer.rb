class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :path, :user_id, :event_id, :approved, :requirement, :image

  def requirement
    object.requirement.description
  end

  def image
    object.path.file unless object.path.nil?
  end
end
