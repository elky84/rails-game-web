class AddEnchantResultToSkillEnchant < ActiveRecord::Migration
  def change
    add_column :skill_enchants, :ENCHANT_RESULT, :string
  end
end
