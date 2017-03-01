class RemoveIconImageToShopItems < ActiveRecord::Migration
  def change
    remove_column :shop_items, :ICON_IMAGE, :string
  end
end
