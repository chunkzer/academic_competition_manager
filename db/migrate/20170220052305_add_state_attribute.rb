class AddStateAttribute < ActiveRecord::Migration
  def change
    remove_column :documents, :approved
    add_column :documents, :state, :integer
  end
end
