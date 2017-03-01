class ShopItem < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("SHOP_ITEM_ID = ?", "#{search}")
    else
      where("\"SHOP_ITEM_ID\" = ?", "#{search}")
    end 
  end
end
