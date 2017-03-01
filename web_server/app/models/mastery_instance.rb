class MasteryInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("GROUP_NO = ?", "#{search}")
    else
      where("\"GROUP_NO\" = ?", "#{search}")
    end 
  end
end
