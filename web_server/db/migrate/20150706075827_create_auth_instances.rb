class CreateAuthInstances < ActiveRecord::Migration
  def change
    create_table :auth_instances do |t|
      t.integer :USER_NO
      t.text :PRIVATE_KEY
      t.text :IP
      t.text :AUTH_KEY

      t.timestamps
    end
    add_index :auth_instances, :USER_NO
  end
end
