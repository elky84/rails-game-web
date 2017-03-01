class AddInfiTowerFloorToUserInstances < ActiveRecord::Migration
  def change
    add_column :user_instances, :INFI_TOWER_FLOOR, :integer
  end
end
