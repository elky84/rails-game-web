class CreateUserGiveInstances < ActiveRecord::Migration
  def change
    create_table :user_give_instances do |t|
      t.integer :USER_NO
      t.text :GIVE_REPLY

      t.timestamps
    end
    add_index :user_give_instances, :USER_NO
  end
end
