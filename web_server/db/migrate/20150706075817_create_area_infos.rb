class CreateAreaInfos < ActiveRecord::Migration
  def change
    create_table :area_infos do |t|
      t.integer :AREA_ID
      t.text :OPEN
      t.timestamp :START_DATE
      t.timestamp :END_DATE
      t.text :AREA_TYPE
      t.text :BG_COLOR
      t.text :NAME
      t.text :EXPLAIN
      t.text :CHARACTER_LEVEL
      t.text :IMAGE
      t.text :MISSION
      t.text :MONSTER
      t.text :ITEM
      t.text :SCENARIO_START
      t.text :SCENARIO_END

      t.timestamps
    end
    add_index :area_infos, :AREA_ID
  end
end
