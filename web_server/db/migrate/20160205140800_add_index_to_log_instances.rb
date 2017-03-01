class AddIndexToLogInstances < ActiveRecord::Migration
  def change
    add_index :log_instances, :LOG_TYPE
  end
end
