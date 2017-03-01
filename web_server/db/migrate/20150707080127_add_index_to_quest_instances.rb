class AddIndexToQuestInstances < ActiveRecord::Migration
  def change
    add_index :quest_instances, :USER_NO
  end
end
