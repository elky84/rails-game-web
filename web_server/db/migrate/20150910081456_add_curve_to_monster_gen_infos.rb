class AddCurveToMonsterGenInfos < ActiveRecord::Migration
  def change
    add_column :monster_gen_infos, :CURVE, :integer
  end
end
