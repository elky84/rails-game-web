class CreateMaxValueInfos < ActiveRecord::Migration
  def change
    create_table :max_value_infos do |t|
      t.integer :MAX_VALUE_ID
      t.text :MAX_SLOT_TYPE
      t.integer :EXT_SLOT
      t.integer :NEXT_EXT_SLOT
      t.text :NEXT_COST

      t.timestamps
    end
    add_index :max_value_infos, :MAX_VALUE_ID
  end
end
