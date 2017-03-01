class RemoveEqualMonsterSkillBonusToMonsterEnchant < ActiveRecord::Migration
  def change
    remove_column :monster_enchants, :EQUAL_MONSTER_SKILL_BONUS, :integer
  end
end
