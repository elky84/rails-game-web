class CreateMonsterEnchantBonus < ActiveRecord::Migration
  def change
    create_table :monster_enchant_bonus do |t|
      t.text :MONSTER_TYPE
      t.integer :STATUS_ID

      t.timestamps
    end
    add_index :monster_enchant_bonus, :MONSTER_TYPE
  end
end
