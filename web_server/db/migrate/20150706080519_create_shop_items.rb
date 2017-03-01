class CreateShopItems < ActiveRecord::Migration
  def change
    create_table :shop_items do |t|
      t.integer :SHOP_ITEM_ID
      t.integer :HIDE
      t.text :STORE
      t.text :ICON
      t.text :PRICE_TYPE
      t.integer :PRICE
      t.text :SHOP_CATEGORY
      t.integer :CAPACITY
      t.integer :ITEM_ID
      t.integer :GACHA
      t.text :BONUS_ID
      t.text :NAME
      t.text :EXPLAIN
      t.text :ICON_IMAGE
      t.timestamp :START_DATE
      t.timestamp :END_DATE

      t.timestamps
    end
    add_index :shop_items, :SHOP_ITEM_ID
  end
end
