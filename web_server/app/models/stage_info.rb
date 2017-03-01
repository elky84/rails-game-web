class StageInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("STAGE_ID = ?", "#{search}")
    else
      where("\"STAGE_ID\" = ?", "#{search}")
    end 
  end
end
