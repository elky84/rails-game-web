class SkillInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("SKILL_NO = ?", "#{search}")
    else
      where("\"SKILL_NO\" = ?", "#{search}")
    end 
  end
end
