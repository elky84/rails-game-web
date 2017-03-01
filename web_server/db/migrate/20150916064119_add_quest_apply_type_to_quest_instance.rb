class AddQuestApplyTypeToQuestInstance < ActiveRecord::Migration
  def change
    add_column :quest_instances, :QUEST_APPLY_TYPE, :text
    add_column :quest_instances, :GRADE, :integer
    add_column :quest_instances, :GROUP_ID, :integer
  end
end
