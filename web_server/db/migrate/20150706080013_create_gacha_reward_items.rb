class CreateGachaRewardItems < ActiveRecord::Migration
  def change
    create_table :gacha_reward_items do |t|
      t.integer :GACHA_REWARD_ITEM_ID
      t.integer :ITEM_ID

      t.timestamps
    end
    add_index :gacha_reward_items, :GACHA_REWARD_ITEM_ID
  end
end
