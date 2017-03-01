class AddInfiTowerPreviewToStageInfos < ActiveRecord::Migration
  def change
    add_column :stage_infos, :INFI_TOWER_PREVIEW, :string
  end
end
