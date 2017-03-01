class CreatePvpSuccessionBonusInfos < ActiveRecord::Migration
  def change
    create_table :pvp_succession_bonus_infos do |t|
      t.integer :PVP_SUCCESSION_BONUS_ID
      t.integer :BONUS_POINT

      t.timestamps
    end
    add_index :pvp_succession_bonus_infos, :PVP_SUCCESSION_BONUS_ID
  end
end
