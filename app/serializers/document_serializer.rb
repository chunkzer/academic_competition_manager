class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :path, :user_id, :state, :requirement, :image

  def requirement
    object.requirement.description
  end

  def image
    object.path.file unless object.path.nil?
  end
end
