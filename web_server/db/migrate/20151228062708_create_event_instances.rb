class CreateEventInstances < ActiveRecord::Migration
  def change
    create_table :event_instances do |t|
      t.integer :EVENT_NO
      t.text :EVENT_TYPE
      t.text :REWARD
      t.timestamp :START_DATE
      t.timestamp :END_DATE

      t.timestamps null: false
    end
    add_index :event_instances, :EVENT_NO
  end
end
