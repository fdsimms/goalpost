class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.boolean :private, default: true
      t.integer :user_id, null: false, index: true
      t.timestamps null: false
    end
  end
end
