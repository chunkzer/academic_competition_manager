class AddSpecificationsAttr < ActiveRecord::Migration
  def change
    add_column :requirements, :specifications, :text
  end
end
