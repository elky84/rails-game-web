class AddServerIndexToCouponInstances < ActiveRecord::Migration
  def change
    add_column :coupon_instances, :SERVER_INDEX, :integer
  end
end
