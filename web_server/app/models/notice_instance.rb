class NoticeInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("NOTICE_NO = ?", "#{search}")
    else
      where("`NOTICE_NO` = ?", "#{search}")
    end 
  end
end
