class QuestType < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("QUEST_TYPE_ID = ?", "#{search}")
    else
      where("`QUEST_TYPE_ID` = ?", "#{search}")
    end 
  end
end
