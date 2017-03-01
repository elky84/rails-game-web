class AddIndexToMasteryInstances < ActiveRecord::Migration
  def change
    add_index :mastery_instances, :USER_NO
  end
end
