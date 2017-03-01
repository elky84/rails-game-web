class AddCostumeIdToPvpInstances < ActiveRecord::Migration
  def change
    add_column :pvp_instances, :COSTUME_ID, :integer
  end
end
