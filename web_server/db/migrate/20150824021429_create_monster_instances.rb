class CreateMonsterInstances < ActiveRecord::Migration
  def change
    create_table :monster_instances do |t|
      t.integer :MONSTER_NO
      t.integer :USER_NO
      t.integer :CHARACTER_NO
      t.integer :MONSTER_ID
      t.text :GROW_TYPE_DETAIL
      t.integer :LEVEL
      t.integer :EXP
      t.text :SKILL
      t.integer :TEAM_SLOT
      t.integer :NEW

      t.timestamps
    end
    add_index :monster_instances, :MONSTER_NO
  end
end
