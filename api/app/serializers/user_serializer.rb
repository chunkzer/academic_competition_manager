class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :role, :full_name

  def role
    object.role_id
  end

  def full_name
    object.full_name
  end
end
