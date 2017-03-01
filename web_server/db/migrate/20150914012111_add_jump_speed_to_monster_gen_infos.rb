class AddJumpSpeedToMonsterGenInfos < ActiveRecord::Migration
  def change
    add_column :monster_gen_infos, :JUMP_SPEED, :text
  end
end
