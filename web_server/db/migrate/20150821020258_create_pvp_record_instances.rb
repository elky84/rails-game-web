class CreatePvpRecordInstances < ActiveRecord::Migration
  def change
    create_table :pvp_record_instances do |t|
      t.integer :PVP_RECORD_INSTANCE_NO
      t.integer :SEASON_NUM
      t.integer :CHARACTER_NO
      t.text :RESULT
      t.timestamp :RESULT_TIME
      t.integer :ADD_RATING
      t.integer :RESULT_RATING
      t.integer :MATCH_CHARACTER_NO
      t.integer :MATCH_CHR_LV
      t.integer :MATCH_CHR_ID
      t.text :MATCH_USER_NICKNAME
      t.integer :MATCH_USER_LV
      t.text :MATCH_CHR_DEF_POWER

      t.timestamps
    end
    add_index :pvp_record_instances, :PVP_RECORD_INSTANCE_NO
  end
end
