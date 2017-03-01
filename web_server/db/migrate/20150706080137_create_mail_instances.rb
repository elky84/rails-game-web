class CreateMailInstances < ActiveRecord::Migration
  def change
    create_table :mail_instances do |t|
      t.integer :MAIL_NO
      t.integer :USER_NO
      t.text :TITLE
      t.text :CONTENT
      t.text :SENDER
      t.integer :SENDER_ACTOR_ID
      t.integer :SENDER_USER_NO
      t.text :OPENED
      t.text :REWARD
      t.timestamp :END_DATE

      t.timestamps
    end
    add_index :mail_instances, :MAIL_NO
  end
end
