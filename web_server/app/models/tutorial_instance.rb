class TutorialInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("TUTORIAL_NO = ?", "#{search}")
    else
      where("`TUTORIAL_NO` = ?", "#{search}")
    end 
  end
end
