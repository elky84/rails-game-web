class Parameter < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("PARAMETER_ID = ?", "#{search}")
    else
      where("`PARAMETER_ID` = ?", "#{search}")
    end 
  end
end
