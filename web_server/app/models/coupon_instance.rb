class CouponInstance < ActiveRecord::Base
	def self.search(search)
    if Rails.env.development?
      where("COUPON_INDEX = ?", "#{search}")
    else
      where("\"COUPON_INDEX\" = ?", "#{search}")
    end 
  end
end
