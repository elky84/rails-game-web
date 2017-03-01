class FriendInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("FRIEND_NO = ?", "#{search}")
    else
      where("\"FRIEND_NO\" = ?", "#{search}")
    end 
  end
end
