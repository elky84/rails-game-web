class Condition < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("CONDITION_ID = ?", "#{search}")
    else
      where("`CONDITION_ID` = ?", "#{search}")
    end 
  end
end
