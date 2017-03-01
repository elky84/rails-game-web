class AddCouponGroupToCouponInstances < ActiveRecord::Migration
  def change
    add_column :coupon_instances, :COUPON_GROUP, :string
  end
end
