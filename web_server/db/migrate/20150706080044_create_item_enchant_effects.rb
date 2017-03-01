class CreateItemEnchantEffects < ActiveRecord::Migration
  def change
    create_table :item_enchant_effects do |t|
      t.integer :ITEM_ENCHANT_EFFECT_ID
      t.integer :GRADE
      t.integer :ENCHANT
      t.text :BASIC_EFFECT
      t.text :BONUS_EFFECT

      t.timestamps
    end
    add_index :item_enchant_effects, :ITEM_ENCHANT_EFFECT_ID
  end
end
