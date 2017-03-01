class AddFriendUserAdvTogetherDateToFriendInstances < ActiveRecord::Migration
  def change
    add_column :friend_instances, :FRIEND_USER_ADV_TOGETHER_DATE, :timestamp
  end
end
