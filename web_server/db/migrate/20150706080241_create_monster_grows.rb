class CreateMonsterGrows < ActiveRecord::Migration
  def change
    create_table :monster_grows do |t|
      t.integer :GROW_ID
      t.integer :LEVEL
      t.text :GROW_TYPE_DETAIL
      t.integer :REQUIRE_EXP
      t.integer :STATUS_ID

      t.timestamps
    end
    add_index :monster_grows, :GROW_ID
  end
end
