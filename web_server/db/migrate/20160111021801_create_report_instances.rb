class CreateReportInstances < ActiveRecord::Migration
  def change
    create_table :report_instances do |t|
      t.integer :REPORT_NO
      t.integer :USER_NO
      t.integer :CHARACTER_NO
      t.text :REPORT_TYPE
      t.text :VALUE
      t.integer :USER_LV
      t.integer :EXP
      t.timestamp :ACTION_TIME
      t.text :IP

      t.timestamps null: false
    end
    add_index :report_instances, :REPORT_NO
  end
end
