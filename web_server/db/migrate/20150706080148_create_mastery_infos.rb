class CreateMasteryInfos < ActiveRecord::Migration
  def change
    create_table :mastery_infos do |t|
      t.integer :MASTERY_ID
      t.text :MASTERY_TYPE
      t.integer :GRADE
      t.text :NAME
      t.text :EXPLAIN
      t.integer :MAX_LEVEL
      t.text :OPTION_ID
      t.text :OPTION_EFFECT
      t.text :EFFECT_TARGET
      t.integer :PRE_LEVEL
      t.integer :PRE_CONDITION
      t.text :ICON

      t.timestamps
    end
    add_index :mastery_infos, :MASTERY_ID
  end
end
