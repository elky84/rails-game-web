class AreaInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("AREA_ID = ?", "#{search}")
    else
      where("`AREA_ID` = ?", "#{search}")
    end 
  end
end
