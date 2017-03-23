class MonsterInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("MONSTER_NO = ?", "#{search}")
    else
      where("`MONSTER_NO` = ?", "#{search}")
    end 
  end
end
