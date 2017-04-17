class RemoveEventIdFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :event_id
  end
end
