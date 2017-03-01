class CreateNoticeInstances < ActiveRecord::Migration
  def change
    create_table :notice_instances do |t|
      t.integer :NOTICE_NO
      t.text :NOTICE_TYPE
      t.text :CONTENT

      t.timestamps
    end
    add_index :notice_instances, :NOTICE_NO
  end
end
