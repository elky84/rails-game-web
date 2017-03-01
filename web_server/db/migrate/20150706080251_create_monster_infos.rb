class CreateMonsterInfos < ActiveRecord::Migration
  def change
    create_table :monster_infos do |t|
      t.integer :MONSTER_ID
      t.text :MONSTER_TYPE
      t.integer :MONSTER_GRADE
      t.text :GROW_TYPE
      t.text :GROW_TYPE_DETAIL
      t.integer :MONSTER_PRICE
      t.integer :ACTOR_ID
      t.integer :SKIN_NUM
      t.text :GACHA_SPEECH

      t.timestamps
    end
    add_index :monster_infos, :MONSTER_ID
  end
end
