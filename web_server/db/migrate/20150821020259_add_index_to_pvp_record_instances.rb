class AddIndexToPvpRecordInstances < ActiveRecord::Migration
  def change
    add_index :pvp_record_instances, :CHARACTER_NO
  end
end
