class AddIndexToFriendInstances < ActiveRecord::Migration
  def change
    add_index :friend_instances, :USER_NO
  end
end
