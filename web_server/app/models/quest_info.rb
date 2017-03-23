class QuestInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("QUEST_INFO_ID = ?", "#{search}")
    else
      where("`QUEST_INFO_ID` = ?", "#{search}")
    end 
  end
end
