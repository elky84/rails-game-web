class CreateGachaGroups < ActiveRecord::Migration
  def change
    create_table :gacha_groups do |t|
      t.integer :GACHA_GROUP_ID
      t.text :GROUP_REWARD
      t.text :DESCRIPTION

      t.timestamps
    end
    add_index :gacha_groups, :GACHA_GROUP_ID
  end
end
