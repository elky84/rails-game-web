class AddIndexes < ActiveRecord::Migration
  def change
    add_index :statistics_instances, :DATE
    add_index :statistics_instances, :TYPE
	
	add_index :stage_instances, :CHARACTER_NO
	
	add_index :mail_instances, :SENDER_USER_NO

	add_index :item_instances, :CHARACTER_NO
	add_index :item_instances, :SLOT_TYPE	
  end
end