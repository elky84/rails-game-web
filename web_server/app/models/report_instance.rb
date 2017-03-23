class ReportInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("REPORT_NO = ?", "#{search}")
    else
      where("`REPORT_NO` = ?", "#{search}")
    end 
  end
end
