class AddIndexToPvpInstances < ActiveRecord::Migration
  def change
    add_index :pvp_instances, :RATING
  end
end
