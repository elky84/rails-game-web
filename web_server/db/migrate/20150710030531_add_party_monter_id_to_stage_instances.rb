class AddPartyMonterIdToStageInstances < ActiveRecord::Migration
  def change
    add_column :stage_instances, :PARTY_MONSTER_ID, :text
  end
end
