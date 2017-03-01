class CreatePvpRewardInfos < ActiveRecord::Migration
  def change
    create_table :pvp_reward_infos do |t|
      t.integer :PVP_REWARD_ID
      t.text :RANGE_TYPE
      t.integer :MIN
      t.integer :MAX
      t.text :REWARD_TYPE_AND_CAPACITY

      t.timestamps
    end
    add_index :pvp_reward_infos, :PVP_REWARD_ID
  end
end
