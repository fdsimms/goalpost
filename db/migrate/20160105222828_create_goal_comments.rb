class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.text :body, null: false
      t.integer :comment_id, null: false, index: true
      t.integer :commenter_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
