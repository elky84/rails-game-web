class MasteryPointInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("MASTERY_POINT = ?", "#{search}")
    else
      where("\"MASTERY_POINT\" = ?", "#{search}")
    end 
  end
end
