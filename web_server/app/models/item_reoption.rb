class ItemReoption < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("ITEM_REOPTION_ID = ?", "#{search}")
    else
      where("\"ITEM_REOPTION_ID\" = ?", "#{search}")
    end 
  end
end
