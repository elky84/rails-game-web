class RemoveEnchantResultToSkillEnchant < ActiveRecord::Migration
  def change
    remove_column :skill_enchants, :ENCHANT_RESULT, :text
  end
end
