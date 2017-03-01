class AddGroupIdToQuestInfos < ActiveRecord::Migration
  def change
    add_column :quest_infos, :GROUP_ID, :integer
    add_column :quest_infos, :QUEST_APPLY_TYPE, :text
    add_column :quest_infos, :LEVEL_LIMIT, :integer
    add_column :quest_infos, :COMPLETE_IMAGE, :text
    add_column :quest_infos, :COMPLETE_SCENE, :text
    add_column :quest_infos, :COMPLETE_EXPLAN, :text
  end
end
