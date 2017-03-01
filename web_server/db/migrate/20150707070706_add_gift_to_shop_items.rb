class AddGiftToShopItems < ActiveRecord::Migration
  def change
    add_column :shop_items, :GIFT, :string
  end
end
