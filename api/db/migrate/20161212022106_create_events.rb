class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_date
      t.datetime :registration_deadline
      t.text :description

      t.timestamps null: false
    end
  end
end
