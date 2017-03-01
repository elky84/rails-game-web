class AddMasteryPointToCharacterInstances < ActiveRecord::Migration
  def change
    add_column :character_instances, :MASTERY_POINT, :integer
  end
end
