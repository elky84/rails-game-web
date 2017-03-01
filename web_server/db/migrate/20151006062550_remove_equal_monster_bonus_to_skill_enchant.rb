class RemoveEqualMonsterBonusToSkillEnchant < ActiveRecord::Migration
  def change
    remove_column :skill_enchants, :EQUAL_MONSTER_BONUS, :integer
  end
end
