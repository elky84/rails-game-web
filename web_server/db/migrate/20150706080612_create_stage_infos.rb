class CreateStageInfos < ActiveRecord::Migration
  def change
    create_table :stage_infos do |t|
      t.integer :STAGE_ID
      t.integer :AREA_ID
      t.text :STAGE_NUMBER
      t.text :OPEN
      t.text :TYPE
      t.text :LEVEL
      t.text :COORDINATE
      t.text :BG_COLOR
      t.text :NAME
      t.text :EXPLAIN
      t.text :CHARACTER_LEVEL
      t.text :STAMINA
      t.text :PHASE
      t.text :MONSTER
      t.text :ITEM
      t.text :STAGE_ICON
      t.text :CLEAR_SCORE
      t.text :CLEAR_EXP
      t.text :CLEAR_MONEY
      t.text :CLEAR_1_REWARD
      t.text :CLEAR_1_REWARD_PROBABILITY
      t.text :CLEAR_2_REWARD
      t.text :CLEAR_2_REWARD_PROBABILITY
      t.text :CLEAR_3_REWARD
      t.text :CLEAR_3_REWARD_PROBABILITY
      t.text :START_SCENARIO
      t.text :END_SCENARIO
      t.text :BG_PREFEB

      t.timestamps
    end
    add_index :stage_infos, :STAGE_ID
  end
end
