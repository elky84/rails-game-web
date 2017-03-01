class AddRangeCheckReactionIndexToSkillScripts < ActiveRecord::Migration
  def change
    add_column :skill_scripts, :RANGE_CHECK_REACTION_INDEX, :integer
  end
end
