class AddNstorePidToShopItems < ActiveRecord::Migration
  def change
    add_column :shop_items, :NSTORE_PID, :string
  end
end
