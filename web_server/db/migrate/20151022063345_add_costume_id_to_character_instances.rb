class AddCostumeIdToCharacterInstances < ActiveRecord::Migration
  def change
    add_column :character_instances, :COSTUME_ID, :integer
  end
end
