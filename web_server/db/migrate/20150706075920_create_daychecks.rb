class CreateDaychecks < ActiveRecord::Migration
  def change
    create_table :daychecks do |t|
      t.integer :DAYCHECK_ID
      t.integer :USER_TYPE
      t.integer :DAY
      t.text :REWARD
      t.text :UI_LABEL
      t.text :ICON

      t.timestamps
    end
    add_index :daychecks, :DAYCHECK_ID
  end
end
