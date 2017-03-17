class AddIndexToUserInstances < ActiveRecord::Migration
  def change
    remove_column :user_instances, :NICKNAME, :text
	add_column :user_instances, :NICKNAME, :string
  
    add_index :user_instances, :NICKNAME
  end
end
