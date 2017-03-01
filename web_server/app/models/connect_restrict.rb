class ConnectRestrict < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("CONNECT_RESTRICT_NO = ?", "#{search}")
    else
      where("\"CONNECT_RESTRICT_NO\" = ?", "#{search}")
    end 
  end
end
