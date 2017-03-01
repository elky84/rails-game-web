class RemoveMasteryPointToCharacterInstances < ActiveRecord::Migration
  def change
    remove_column :character_instances, :MASTERY_POINT, :integer
  end
end
