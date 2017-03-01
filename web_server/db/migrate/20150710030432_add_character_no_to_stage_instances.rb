class AddCharacterNoToStageInstances < ActiveRecord::Migration
  def change
    add_column :stage_instances, :CHARACTER_NO, :integer
  end
end
