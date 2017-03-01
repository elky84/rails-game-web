class PhaseInfo < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("PHASE_ID = ?", "#{search}")
    else
      where("\"PHASE_ID\" = ?", "#{search}")
    end 
  end
end
