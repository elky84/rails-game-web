class Option < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("OPTION_ID = ?", "#{search}")
    else
      where("`OPTION_ID` = ?", "#{search}")
    end 
  end
end
