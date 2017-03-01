class AddLevelToItemEnchants < ActiveRecord::Migration
  def change
    add_column :item_enchants, :LEVEL, :integer
    add_column :item_enchants, :ITEM_CATEGORY, :text
  end
end
