class CreateCharacterInfos < ActiveRecord::Migration
  def change
    create_table :character_infos do |t|
      t.integer :CHARACTER_ID
      t.text :TYPE
      t.text :GROW_TYPE_DETAIL
      t.text :EQUIP_TYPE
      t.text :NAME
      t.text :EXPLAIN
      t.integer :ACTOR_ID
      t.integer :PRICE

      t.timestamps
    end
    add_index :character_infos, :CHARACTER_ID
  end
end
