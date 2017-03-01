class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.integer :CONDITION_ID
      t.text :CONDITION_EFFECT
      t.text :CONDITION_INFO
      t.integer :PERCENT
      t.text :CONDITION_APPLY_TYPE

      t.timestamps
    end
    add_index :conditions, :CONDITION_ID
  end
end
