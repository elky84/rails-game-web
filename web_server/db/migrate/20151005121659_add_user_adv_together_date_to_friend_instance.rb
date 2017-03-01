class AddUserAdvTogetherDateToFriendInstance < ActiveRecord::Migration
  def change
    add_column :friend_instances, :USER_ADV_TOGETHER_DATE, :timestamp
    add_column :friend_instances, :FRIEND_USER_ADV_TOGETHER_DATE, :timestamp
    add_column :friend_instances, :IS_BOT, :integer
  end
end
