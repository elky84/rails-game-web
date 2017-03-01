class QuestSchedule < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("QUEST_SCHEDULE_ID = ?", "#{search}")
    else
      where("\"QUEST_SCHEDULE_ID\" = ?", "#{search}")
    end 
  end
end
