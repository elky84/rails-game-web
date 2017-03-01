class AddIndexToCharacterInstances < ActiveRecord::Migration
  def change
    add_index :character_instances, :USER_NO
  end
end
