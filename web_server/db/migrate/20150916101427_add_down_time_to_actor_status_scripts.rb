class AddDownTimeToActorStatusScripts < ActiveRecord::Migration
  def change
    add_column :actor_status_scripts, :DOWN_TIME, :text
  end
end
