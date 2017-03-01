class CreateFriendInstances < ActiveRecord::Migration
  def change
    create_table :friend_instances do |t|
      t.integer :FRIEND_NO
      t.integer :USER_NO
      t.integer :FRIEND_USER_NO
      t.integer :STATE
      t.timestamp :USER_SEND_POINT_DATE
      t.timestamp :FRIEND_USER_SEND_POINT_DATE

      t.timestamps
    end
    add_index :friend_instances, :FRIEND_NO
  end
end
