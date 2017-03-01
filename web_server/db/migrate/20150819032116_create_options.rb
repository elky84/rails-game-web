class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :OPTION_ID
      t.integer :CONDITION_ID
      t.text :PARAMETER_ID
      t.text :DESCRIPTION
      t.text :UI_SCRIPT
      t.text :VALUE
      t.text :MAX_VALUE
      t.integer :RANDON_ACTIVITY

      t.timestamps
    end
    add_index :options, :OPTION_ID
  end
end
