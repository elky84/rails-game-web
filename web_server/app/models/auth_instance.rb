class AuthInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("USER_NO = ?", "#{search}")
    else
      where("\"USER_NO\" = ?", "#{search}")
    end 
  end
end
