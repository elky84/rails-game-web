class CreateDaycheckScripts < ActiveRecord::Migration
  def change
    create_table :daycheck_scripts do |t|
      t.integer :DAYCHECK_ID
      t.integer :USER_TYPE
      t.integer :DAY
      t.string :REWARD
      t.string :UI_LABEL
      t.string :ICON

      t.timestamps
    end
  end
end
