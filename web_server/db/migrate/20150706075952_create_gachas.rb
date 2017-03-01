class CreateGachas < ActiveRecord::Migration
  def change
    create_table :gachas do |t|
      t.integer :GACHA_ID
      t.integer :GACHA_MACHINE_TYPE
      t.text :GROUP_ID
      t.text :REWARD_PROBABILITY

      t.timestamps
    end
    add_index :gachas, :GACHA_ID
  end
end
