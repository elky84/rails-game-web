class AddPlayPidToShopItems < ActiveRecord::Migration
  def change
    add_column :shop_items, :PLAY_PID, :string
  end
end
