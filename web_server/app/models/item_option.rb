class ItemOption < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("ITEM_OPTION_ID = ?", "#{search}")
    else
      where("`ITEM_OPTION_ID` = ?", "#{search}")
    end 
  end
end
