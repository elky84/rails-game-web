class CreateStatisticsInstances < ActiveRecord::Migration
  def change
    create_table :statistics_instances do |t|
      t.integer :STATISTICS_NO
      t.text :TYPE
      t.integer :VALUE
      t.text :INFO
      t.text :DATE

      t.timestamps
    end
    add_index :statistics_instances, :STATISTICS_NO
  end
end
