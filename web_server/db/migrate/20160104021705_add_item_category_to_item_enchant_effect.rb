class AddItemCategoryToItemEnchantEffect < ActiveRecord::Migration
  def change
    add_column :item_enchant_effects, :ITEM_CATEGORY, :text
    add_column :item_enchant_effects, :LEVEL, :integer
  end
end
