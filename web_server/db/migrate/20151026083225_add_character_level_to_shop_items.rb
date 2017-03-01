class AddCharacterLevelToShopItems < ActiveRecord::Migration
  def change
    add_column :shop_items, :CHARACTER_LEVEL, :integer
  end
end
