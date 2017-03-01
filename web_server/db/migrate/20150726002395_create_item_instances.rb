class CreateItemInstances < ActiveRecord::Migration
  def change
    create_table :item_instances do |t|
      t.integer :ITEM_NO
      t.integer :ITEM_ID
      t.integer :USER_NO
      t.integer :CHARACTER_NO
      t.timestamp :START_DATE
      t.timestamp :END_DATE
      t.text :ITEM_NAME
      t.integer :LEVEL
      t.integer :GRADE
      t.text :LIMIT
      t.integer :VALUE
      t.text :DEFAULT_OPTION
      t.text :OPTION_LIST
      t.text :SLOT_TYPE
      t.text :EXPIRE_TYPE
      t.integer :DURABILITY
      t.integer :ENCHANT

      t.timestamps
    end
    add_index :item_instances, :ITEM_NO
  end
end
