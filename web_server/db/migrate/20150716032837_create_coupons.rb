class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :COUPON_INDEX
      t.text :REWARD
      t.text :COUPON_STRING

      t.timestamps
    end
    add_index :coupons, :COUPON_INDEX
  end
end
