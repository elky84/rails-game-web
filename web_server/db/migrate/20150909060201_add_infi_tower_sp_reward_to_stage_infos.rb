class AddInfiTowerSpRewardToStageInfos < ActiveRecord::Migration
  def change
    add_column :stage_infos, :INFI_TOWER_SP_REWARD, :string
  end
end
