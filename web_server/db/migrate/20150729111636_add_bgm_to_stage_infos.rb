class AddBgmToStageInfos < ActiveRecord::Migration
  def change
    add_column :stage_infos, :BGM, :string
  end
end
