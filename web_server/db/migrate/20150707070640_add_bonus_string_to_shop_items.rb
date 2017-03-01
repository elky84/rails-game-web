class AddBonusStringToShopItems < ActiveRecord::Migration
  def change
    add_column :shop_items, :BONUS_STRING, :string
  end
end
