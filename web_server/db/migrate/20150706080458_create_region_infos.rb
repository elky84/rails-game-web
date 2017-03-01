class CreateRegionInfos < ActiveRecord::Migration
  def change
    create_table :region_infos do |t|
      t.integer :REGION_ID
      t.text :OPEN
      t.text :CATEGORY
      t.text :IMAGE
      t.text :NAME
      t.text :EXPLAIN
      t.text :LEVEL
      t.text :NORMAL_STAGE
      t.text :HARD_STAGE
      t.text :HELL_STAGE
      t.text :MONSTER
      t.text :ITEM
      t.text :SCENARIO_START
      t.text :SCENARIO_END

      t.timestamps
    end
    add_index :region_infos, :REGION_ID
  end
end
