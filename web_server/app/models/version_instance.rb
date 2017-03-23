class VersionInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("VALUE = ?", "#{search}")
    else
      where("`VALUE` = ?", "#{search}")
    end 
  end
end
