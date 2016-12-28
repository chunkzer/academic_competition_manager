class AddApprovedBooleanToEventSubscribers < ActiveRecord::Migration
  def change
    add_column :event_subscribers, :approved, :boolean
  end
end
