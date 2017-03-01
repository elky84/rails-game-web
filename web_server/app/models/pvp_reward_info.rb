class PvpRewardInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("PVP_REWARD_ID = ?", "#{search}")
    else
      where("\"PVP_REWARD_ID\" = ?", "#{search}")
    end 
  end
end
