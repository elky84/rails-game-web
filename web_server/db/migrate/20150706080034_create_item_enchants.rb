class CreateItemEnchants < ActiveRecord::Migration
  def change
    create_table :item_enchants do |t|
      t.integer :ITEM_ENCHANT_ID
      t.integer :GRADE
      t.integer :ENCHANT
      t.text :ENCHANT_PROBABILITY
      t.integer :MONEY

      t.timestamps
    end
    add_index :item_enchants, :ITEM_ENCHANT_ID
  end
end
