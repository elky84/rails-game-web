class CreateConnectRestricts < ActiveRecord::Migration
  def change
    create_table :connect_restricts do |t|
      t.integer :CONNECT_RESTRICT_ID
      t.text :TYPE
      t.text :VALUE

      t.timestamps
    end
  end
end
