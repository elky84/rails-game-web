class AddMasteryPointToUserInstances < ActiveRecord::Migration
  def change
    add_column :user_instances, :MASTERY_POINT, :integer
  end
end
