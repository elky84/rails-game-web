class MasteryInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("MASTERY_ID = ?", "#{search}")
    else
      where("`MASTERY_ID` = ?", "#{search}")
    end 
  end
end
