class AddIndexToDayCheckInstances < ActiveRecord::Migration
  def change
    add_index :daycheck_instances, :USER_NO
  end
end
