class AddApprovedBooleanToEventSubscriptions < ActiveRecord::Migration
  def change
    add_column :event_subscriptions, :approved, :boolean
  end
end
