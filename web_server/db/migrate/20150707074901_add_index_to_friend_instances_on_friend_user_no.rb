class AddIndexToFriendInstancesOnFriendUserNo < ActiveRecord::Migration
  def change
    add_index :friend_instances, :FRIEND_USER_NO
  end
end
