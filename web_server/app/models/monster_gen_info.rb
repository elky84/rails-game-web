class MonsterGenInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("INDEX = ?", "#{search}")
    else
      where("\"INDEX\" = ?", "#{search}")
    end 
  end
end
