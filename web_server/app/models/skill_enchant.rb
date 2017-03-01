class SkillEnchant < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("SKILL_ENCHANT_ID = ?", "#{search}")
    else
      where("\"SKILL_ENCHANT_ID\" = ?", "#{search}")
    end 
  end
end
