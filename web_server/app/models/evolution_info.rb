class EvolutionInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("EVOLUTION_ID = ?", "#{search}")
    else
      where("\"EVOLUTION_ID\" = ?", "#{search}")
    end 
  end
end
