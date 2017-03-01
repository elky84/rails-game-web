class PvpRange < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("PVP_RANGE_ID = ?", "#{search}")
    else
      where("\"PVP_RANGE_ID\" = ?", "#{search}")
    end 
  end
end
