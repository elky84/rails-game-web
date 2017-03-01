class AddHomeAniToActorStatusScript < ActiveRecord::Migration
  def change
    add_column :actor_status_scripts, :home_ani, :text
  end
end
