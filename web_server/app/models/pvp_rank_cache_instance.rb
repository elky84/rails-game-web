class PvpRankCacheInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("PVP_RANK_CACHE_INSTANCE_NO = ?", "#{search}")
    else
      where("`PVP_RANK_CACHE_INSTANCE_NO` = ?", "#{search}")
    end 
  end
end
