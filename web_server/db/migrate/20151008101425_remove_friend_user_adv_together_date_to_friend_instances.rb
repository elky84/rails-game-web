class RemoveFriendUserAdvTogetherDateToFriendInstances < ActiveRecord::Migration
  def change
    remove_column :friend_instances, :FRIEND_USER_ADV_TOGETHER_DATE, :text
  end
end
