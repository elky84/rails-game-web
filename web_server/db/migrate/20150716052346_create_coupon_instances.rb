class CreateCouponInstances < ActiveRecord::Migration
  def change
    create_table :coupon_instances do |t|
      t.integer :COUPON_INDEX
      t.text :REWARD
      t.text :COUPON_STRING
      t.integer :USER_NO
      t.text :TIME

      t.timestamps
    end
    add_index :coupon_instances, :COUPON_INDEX
  end
end
