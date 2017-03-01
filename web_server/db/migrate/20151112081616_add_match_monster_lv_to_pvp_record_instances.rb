class AddMatchMonsterLvToPvpRecordInstances < ActiveRecord::Migration
  def change
    add_column :pvp_record_instances, :MATCH_MONSTER_LV, :string
  end
end
