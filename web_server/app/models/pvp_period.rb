class PvpPeriod < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("PVP_PERIOD_ID = ?", "#{search}")
    else
      where("\"PVP_PERIOD_ID\" = ?", "#{search}")
    end 
  end
end
