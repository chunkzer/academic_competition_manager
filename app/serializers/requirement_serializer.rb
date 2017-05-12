class RequirementSerializer < ActiveModel::Serializer
  attributes :id, :description, :enabled, :specifications
end
