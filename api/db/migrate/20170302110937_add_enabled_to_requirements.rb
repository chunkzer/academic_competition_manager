class AddEnabledToRequirements < ActiveRecord::Migration
  def change
    add_column :requirements, :enabled, :boolean
  end
end
