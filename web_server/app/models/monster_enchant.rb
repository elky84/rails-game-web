class MonsterEnchant < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("MONSTER_ENCHANT_ID = ?", "#{search}")
    else
      where("`MONSTER_ENCHANT_ID` = ?", "#{search}")
    end 
  end
end
