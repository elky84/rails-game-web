class StageInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("STAGE_PROGRESS_NO = ?", "#{search}")
    else
      where("`STAGE_PROGRESS_NO` = ?", "#{search}")
    end 
  end
end
