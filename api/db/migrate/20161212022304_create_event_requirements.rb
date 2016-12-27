class CreateEventRequirements < ActiveRecord::Migration
  def change
    create_table :event_requirements do |t|
      t.integer :event_id
      t.integer :requirement_id

      t.timestamps null: false
    end
  end
end
