class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :role, :full_name, :notifications

  def role
    object.role_id
  end

  def full_name
    object.full_name
  end

  def notifications
    object.user_notifications.map {|un| UserNotification.notification_dictionary[un.notification_id.to_sym]}
  end
end
