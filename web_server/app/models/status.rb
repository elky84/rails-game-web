class Status < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("STATUS_ID = ?", "#{search}")
    else
      where("\"STATUS_ID\" = ?", "#{search}")
    end 
  end
end
