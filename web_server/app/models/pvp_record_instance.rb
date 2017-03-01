class PvpRecordInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("PVP_RECORD_INSTANCE_NO = ?", "#{search}")
    else
      where("\"PVP_RECORD_INSTANCE_NO\" = ?", "#{search}")
    end 
  end
end
