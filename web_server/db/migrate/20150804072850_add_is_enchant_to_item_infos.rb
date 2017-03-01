class AddIsEnchantToItemInfos < ActiveRecord::Migration
  def change
    add_column :item_infos, :IS_ENCHANT, :integer
  end
end
