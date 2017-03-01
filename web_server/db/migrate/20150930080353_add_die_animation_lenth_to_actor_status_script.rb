class AddDieAnimationLenthToActorStatusScript < ActiveRecord::Migration
  def change
    add_column :actor_status_scripts, :die_animation_lenth, :text
    add_column :actor_status_scripts, :die_animation_speed, :text
  end
end
