class AddUserLvToStatisticsInstances < ActiveRecord::Migration
  def change
    add_column :statistics_instances, :USER_LV, :integer
  end
end
