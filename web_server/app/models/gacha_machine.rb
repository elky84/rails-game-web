class GachaMachine < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("GACHA_MACHINE_ID = ?", "#{search}")
    else
      where("`GACHA_MACHINE_ID` = ?", "#{search}")
    end 
  end
end
