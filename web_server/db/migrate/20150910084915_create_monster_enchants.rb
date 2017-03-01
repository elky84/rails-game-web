class CreateMonsterEnchants < ActiveRecord::Migration
  def change
    create_table :monster_enchants do |t|
      t.integer :MONSTER_ENCHANT_ID
      t.integer :MONSTER_GRADE
      t.text :ENCHANT_RESULT
      t.text :ENCHANT_PERCENT
      t.integer :EQUAL_MONSTER_SKILL_BONUS
      t.text :BASE_EXP
      t.text :LEVEL_BONUS_EXP
      t.text :EQUAL_MONSTER_EXP_BONUS
      t.integer :BASE_MONEY
      t.integer :LEVEL_MONEY

      t.timestamps
    end
    add_index :monster_enchants, :MONSTER_ENCHANT_ID
  end
end
