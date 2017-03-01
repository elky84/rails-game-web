class AddIndexToPvpInstancesOnRank < ActiveRecord::Migration
  def change
    add_index :pvp_instances, :RANK
  end
end
