class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :event_id, :approved, :requirement

  def requirement
    object.requirement.description
  end
end
