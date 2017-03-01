class AddDeadAfterAppearToMonsterGenInfos < ActiveRecord::Migration
  def change
    add_column :monster_gen_infos, :DEAD_AFTER_APPEAR, :integer
  end
end
