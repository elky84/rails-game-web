class RemoveUserAdvTogetherDateToFriendInstances < ActiveRecord::Migration
  def change
    remove_column :friend_instances, :USER_ADV_TOGETHER_DATE, :text
  end
end
