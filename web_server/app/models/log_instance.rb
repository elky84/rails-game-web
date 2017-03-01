class LogInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("LOG_NO = ?", "#{search}")
    else
      where("\"LOG_NO\" = ?", "#{search}")
    end 
  end
end
