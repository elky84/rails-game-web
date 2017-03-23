class ItemInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("ITEM_NO = ?", "#{search}")
    else
      where("`ITEM_NO` = ?", "#{search}")
    end 
  end
end
