class CreateMonsterGenInfos < ActiveRecord::Migration
  def change
    create_table :monster_gen_infos do |t|
      t.integer :INDEX
      t.text :APPEAR_TYPE
      t.text :POSITION
      t.text :MOVE_FROM

      t.timestamps
    end
    add_index :monster_gen_infos, :INDEX
  end
end
