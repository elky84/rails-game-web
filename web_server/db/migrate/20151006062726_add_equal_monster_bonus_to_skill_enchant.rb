class AddEqualMonsterBonusToSkillEnchant < ActiveRecord::Migration
  def change
    add_column :skill_enchants, :EQUAL_MONSTER_BONUS, :float
  end
end
