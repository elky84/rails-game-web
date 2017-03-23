class ActorStatusScript < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("index = ?", "#{search}")
    else
      where("`index` = ?", "#{search}")
    end 
  end
end
