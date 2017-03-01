class AddDirectionToMonsterGenInfos < ActiveRecord::Migration
  def change
    add_column :monster_gen_infos, :DIRECTION, :integer
  end
end
