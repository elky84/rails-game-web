class AddIndexToUserInstances < ActiveRecord::Migration
  def change
    add_index :user_instances, :NICKNAME
  end
end
