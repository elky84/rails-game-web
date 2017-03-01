class ItemInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("ITEM_ID = ?", "#{search}")
    else
      where("\"ITEM_ID\" = ?", "#{search}")
    end 
  end
end
