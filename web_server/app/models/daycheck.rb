class Daycheck < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("DAYCHECK_ID = ?", "#{search}")
    else
      where("\"DAYCHECK_ID\" = ?", "#{search}")
    end 
  end
end
