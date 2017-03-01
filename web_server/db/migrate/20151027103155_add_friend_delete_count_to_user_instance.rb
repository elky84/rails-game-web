class AddFriendDeleteCountToUserInstance < ActiveRecord::Migration
  def change
    add_column :user_instances, :FRIEND_DELETE_COUNT, :integer
  end
end
