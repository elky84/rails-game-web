class AddIsSellToItemInfos < ActiveRecord::Migration
  def change
    add_column :item_infos, :IS_SELL, :integer
  end
end
