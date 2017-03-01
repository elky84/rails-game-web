class CreateLogInstances < ActiveRecord::Migration
  def change
    create_table :log_instances do |t|
      t.integer :LOG_NO
      t.integer :USER_NO
      t.integer :CHARACTER_NO
      t.text :LOG_TYPE
      t.text :VALUE
      t.integer :CASH
      t.integer :MONEY
      t.integer :USER_LV
      t.integer :EXP
      t.timestamp :ACTION_TIME

      t.timestamps
    end
    add_index :log_instances, :LOG_NO
  end
end
