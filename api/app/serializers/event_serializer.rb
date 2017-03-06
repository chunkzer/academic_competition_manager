class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :event_date, :registration_deadline, :description, :requirements, :users, :user_subscription, :event_subscriptions

  def user_subscription
    current_user = @instance_options[:serializer_params][:current_user]
    return nil if current_user.super_admin? || current_user.admin?
    return object.event_subscriptions.select {|es| es.user_id == current_user.id}[0] if current_user.student?
  end

  def event_date
    object.event_date.to_date.iso8601
  end

  def registration_deadline
    object.registration_deadline.to_date.iso8601
  end

  def event_subscriptions
    object.event_subscriptions.map{ |es| EventSubscriptionSerializer.new(es).attributes}
  end

end
