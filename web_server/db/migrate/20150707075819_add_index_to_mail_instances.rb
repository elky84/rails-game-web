class AddIndexToMailInstances < ActiveRecord::Migration
  def change
    add_index :mail_instances, :USER_NO
  end
end
