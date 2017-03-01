class AddEqualMonsterSkillBonusToMonsterEnchant < ActiveRecord::Migration
  def change
    add_column :monster_enchants, :EQUAL_MONSTER_SKILL_BONUS, :float
  end
end
