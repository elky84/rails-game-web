class CreateItemOptions < ActiveRecord::Migration
  def change
    create_table :item_options do |t|
      t.integer :ITEM_OPTION_ID
      t.integer :OPTION_ID
      t.text :DESCRIPTION
      t.text :GRADE
      t.integer :DETAIL_ID
      t.integer :MIN
      t.integer :MAX

      t.timestamps
    end
    add_index :item_options, :ITEM_OPTION_ID
  end
end
