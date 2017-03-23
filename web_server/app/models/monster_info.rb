class MonsterInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("MONSTER_ID = ?", "#{search}")
    else
      where("`MONSTER_ID` = ?", "#{search}")
    end 
  end
end
