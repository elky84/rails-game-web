class AddUserAdvTogetherDateToFriendInstances < ActiveRecord::Migration
  def change
    add_column :friend_instances, :USER_ADV_TOGETHER_DATE, :timestamp
  end
end
