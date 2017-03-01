class AddWaitTimeToPhaseInfos < ActiveRecord::Migration
  def change
    add_column :phase_infos, :WAIT_TIME, :float
  end
end
