class ItemEnchant < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("ITEM_ENCHANT_ID = ?", "#{search}")
    else
      where("`ITEM_ENCHANT_ID` = ?", "#{search}")
    end 
  end
end
