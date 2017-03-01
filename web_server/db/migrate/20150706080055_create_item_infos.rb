class CreateItemInfos < ActiveRecord::Migration
  def change
    create_table :item_infos do |t|
      t.integer :ITEM_ID
      t.text :ICON
      t.text :NAME
      t.text :EXPLAIN
      t.integer :LEVEL
      t.integer :GRADE
      t.text :LIMIT
      t.text :CATEGORY
      t.integer :COSTUME_ID
      t.text :DEFAULT_OPTION
      t.text :ITEM_OPTION_LIST
      t.integer :PRICE
      t.integer :VALUE
      t.text :EXPIRE_TYPE
      t.integer :DURABILITY

      t.timestamps
    end
    add_index :item_infos, :ITEM_ID
  end
end
