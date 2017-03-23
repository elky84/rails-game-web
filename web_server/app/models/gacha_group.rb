class GachaGroup < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("GACHA_GROUP_ID = ?", "#{search}")
    else
      where("`GACHA_GROUP_ID` = ?", "#{search}")
    end 
  end
end
