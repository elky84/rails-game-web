class AddStartDateToNoticeInstances < ActiveRecord::Migration
  def change
    add_column :notice_instances, :START_DATE, :timestamp
  end
end
