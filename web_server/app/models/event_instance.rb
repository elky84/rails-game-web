class EventInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("EVENT_NO = ?", "#{search}")
    else
      where("`EVENT_NO` = ?", "#{search}")
    end 
  end
end
