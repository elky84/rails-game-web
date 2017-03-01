class MailInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("MAIL_NO = ?", "#{search}")
    else
      where("\"MAIL_NO\" = ?", "#{search}")
    end 
  end
end
