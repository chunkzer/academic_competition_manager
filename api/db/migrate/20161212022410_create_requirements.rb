class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
