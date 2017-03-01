class MaxValueInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("MAX_VALUE_ID = ?", "#{search}")
    else
      where("\"MAX_VALUE_ID\" = ?", "#{search}")
    end 
  end
end
