class SkillScript < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("SKILL_ID = ?", "#{search}")
    else
      where("\"SKILL_ID\" = ?", "#{search}")
    end 
  end
end
