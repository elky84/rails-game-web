class AddIndexToSkillInstances < ActiveRecord::Migration
  def change
    add_index :skill_instances, :CHARACTER_NO
  end
end
