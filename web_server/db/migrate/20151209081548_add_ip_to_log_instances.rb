class AddIpToLogInstances < ActiveRecord::Migration
  def change
    add_column :log_instances, :IP, :string
  end
end
