class MasteryReset < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("MASTERY_RESET_ID = ?", "#{search}")
    else
      where("`MASTERY_RESET_ID` = ?", "#{search}")
    end 
  end
end
