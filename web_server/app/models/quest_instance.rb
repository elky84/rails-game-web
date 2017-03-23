class QuestInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("QUEST_NO = ?", "#{search}")
    else
      where("`QUEST_NO` = ?", "#{search}")
    end 
  end
end
