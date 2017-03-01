class CreatePhaseInfos < ActiveRecord::Migration
  def change
    create_table :phase_infos do |t|
      t.integer :PHASE_ID
      t.text :INIT_POS
      t.text :MOVE_TIME
      t.text :CLEAR
      t.text :STAY_TIME
      t.text :MONSTER
      t.text :MONSTER_GEN_INFO
      t.text :MONSTER_LV
      t.text :APPEAR_SPEED
      t.text :APPEAR_TIME
      t.text :TEAM_INDEX
      t.text :START_SCENARIO
      t.text :END_SCENARIO
      t.integer :IS_BOSS_PHASE
      t.text :PHASE_WIDTH

      t.timestamps
    end
    add_index :phase_infos, :PHASE_ID
  end
end
