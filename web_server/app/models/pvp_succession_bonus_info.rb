class PvpSuccessionBonusInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("PVP_SUCCESSION_BONUS_ID = ?", "#{search}")
    else
      where("`PVP_SUCCESSION_BONUS_ID` = ?", "#{search}")
    end 
  end
end
