class CreatePvpInstances < ActiveRecord::Migration
  def change
    create_table :pvp_instances do |t|
      t.integer :CHARACTER_NO
      t.integer :CHARACTER_LV
      t.integer :CHARACTER_ID
      t.text :USER_NICKNAME
      t.integer :USER_LV
      t.integer :RATING
      t.text :PARTY_ATTACKER
      t.text :ATTACKER_POWER
      t.text :PARTY_DEFENDER
      t.text :DEFENDER_POWER
      t.integer :SEASON_NUM
      t.text :IS_SUCCESSION_VICTORY
      t.integer :SUCCESSION_COUNT
      t.integer :VICTORY_COUNT
      t.integer :DEFEAT_COUNT
      t.integer :CUR_MATCH_NO
      t.integer :RANK

      t.timestamps
    end
    add_index :pvp_instances, :CHARACTER_NO
  end
end
