class CreateSkillEnchants < ActiveRecord::Migration
  def change
    create_table :skill_enchants do |t|
      t.integer :SKILL_ENCHANT_ID
      t.integer :ENCHANT_NUM
      t.integer :MONSTER_GRADE
      t.text :ENCHANT_RESULT
      t.text :ENCHANT_PERCENT
      t.integer :EQUAL_MONSTER_BONUS
      t.integer :MONEY

      t.timestamps
    end
    add_index :skill_enchants, :SKILL_ENCHANT_ID
  end
end
