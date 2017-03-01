class AddMatchMonsterIdToPvpRecordInstances < ActiveRecord::Migration
  def change
    add_column :pvp_record_instances, :MATCH_MONSTER_ID, :string
  end
end
