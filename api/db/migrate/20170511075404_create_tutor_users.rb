class CreateTutorUsers < ActiveRecord::Migration
  def change
    create_table :tutor_users do |t|
      t.string  :name
      t.integer :user_id
      t.integer :tutor_id
      t.string  :email

      t.timestamps null: false
    end
  end
end
