class AddIndexes < ActiveRecord::Migration
  def change
    remove_column :statistics_instances, :DATE, :text
	add_column :statistics_instances, :DATE, :string
    add_index :statistics_instances, :DATE
	
    remove_column :statistics_instances, :TYPE, :text
	add_column :statistics_instances, :TYPE, :string
    add_index :statistics_instances, :TYPE
	
	add_index :stage_instances, :CHARACTER_NO
	
	add_index :mail_instances, :SENDER_USER_NO

	
	add_index :item_instances, :CHARACTER_NO
	
	remove_column :item_instances, :SLOT_TYPE, :text
	add_column :item_instances, :SLOT_TYPE, :string
	add_index :item_instances, :SLOT_TYPE	
  end
end