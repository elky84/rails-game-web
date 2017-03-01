class CreateCharacterGrows < ActiveRecord::Migration
  def change
    create_table :character_grows do |t|
      t.integer :GROW_ID
      t.integer :LEVEL
      t.text :GROW_TYPE_DETAIL
      t.integer :REQUIRE_EXP
      t.integer :STATUS_ID

      t.timestamps
    end
    add_index :character_grows, :GROW_ID
  end
end
