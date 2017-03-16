class AddIndexToLogInstances < ActiveRecord::Migration
  def change
    remove_column :log_instances, :LOG_TYPE, :text
	add_column :log_instances, :LOG_TYPE, :string
    add_index :log_instances, :LOG_TYPE
  end
end
