class CharacterInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("CHARACTER_ID = ?", "#{search}")
    else
      where("\"CHARACTER_ID\" = ?", "#{search}")
    end 
  end
end
