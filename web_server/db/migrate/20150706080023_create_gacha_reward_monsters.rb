class CreateGachaRewardMonsters < ActiveRecord::Migration
  def change
    create_table :gacha_reward_monsters do |t|
      t.integer :GACHA_REWARD_MONSTER_ID
      t.integer :MONSTER_ID

      t.timestamps
    end
    add_index :gacha_reward_monsters, :GACHA_REWARD_MONSTER_ID
  end
end
