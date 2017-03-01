class AddEndDateToNoticeInstances < ActiveRecord::Migration
  def change
    add_column :notice_instances, :END_DATE, :timestamp
  end
end
