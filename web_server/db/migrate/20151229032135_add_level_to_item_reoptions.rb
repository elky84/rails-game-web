class AddLevelToItemReoptions < ActiveRecord::Migration
  def change
    add_column :item_reoptions, :LEVEL, :integer
  end
end
