class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.integer :PARAMETER_ID
      t.text :NAME
      t.text :DESCRIPTION
      t.text :EXPLAIN
      t.text :APPLY_STAT

      t.timestamps
    end
    add_index :parameters, :PARAMETER_ID
  end
end
