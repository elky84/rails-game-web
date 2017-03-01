class Gacha < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("GACHA_ID = ?", "#{search}")
    else
      where("\"GACHA_ID\" = ?", "#{search}")
    end 
  end
end
