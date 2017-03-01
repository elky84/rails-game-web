class AddIndexToItemInstances < ActiveRecord::Migration
  def change
    add_index :item_instances, :USER_NO
  end
end
