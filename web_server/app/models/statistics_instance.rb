class StatisticsInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("STATISTICS_NO = ?", "#{search}")
    else
      where("\"STATISTICS_NO\" = ?", "#{search}")
    end 
  end
end
