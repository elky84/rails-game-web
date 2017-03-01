class CreateDaycheckInstances < ActiveRecord::Migration
  def change
    create_table :daycheck_instances do |t|
      t.integer :DAYCHECK_NO
      t.integer :USER_NO
      t.integer :USER_TYPE
      t.integer :DAYCHECK_ID
      t.text :TIME
      t.integer :CHECK

      t.timestamps
    end
    add_index :daycheck_instances, :DAYCHECK_ID
  end
end
