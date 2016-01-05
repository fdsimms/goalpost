class ChangePrivateInGoalsToPrivacySetting < ActiveRecord::Migration
  def change
    remove_column :goals, :private
    add_column :goals, :privacy_setting, :boolean, default: true
  end
end
