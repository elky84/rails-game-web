class CreateItemReoptions < ActiveRecord::Migration
  def change
    create_table :item_reoptions do |t|
      t.integer :ITEM_REOPTION_ID
      t.integer :GRADE
      t.integer :MONEY

      t.timestamps
    end
    add_index :item_reoptions, :ITEM_REOPTION_ID
  end
end
