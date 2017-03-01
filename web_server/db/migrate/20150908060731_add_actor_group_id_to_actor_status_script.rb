class AddActorGroupIdToActorStatusScript < ActiveRecord::Migration
  def change
    add_column :actor_status_scripts, :actor_group_id, :integer
    add_column :actor_status_scripts, :group_rank_id, :integer
    add_column :actor_status_scripts, :special_skill, :text
    add_column :actor_status_scripts, :special_skill_percent, :text
    add_column :actor_status_scripts, :OTHER_IDLE_USE, :text
  end
end
