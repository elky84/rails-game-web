class RemoveClearToquestInstances < ActiveRecord::Migration
  def change
    remove_column :quest_instances, :CLEAR, :text
    add_column :quest_instances, :CLEAR, :text
  end
end
