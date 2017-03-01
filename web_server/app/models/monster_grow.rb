class MonsterGrow < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("GROW_ID = ?", "#{search}")
    else
      where("\"GROW_ID\" = ?", "#{search}")
    end 
  end
end
