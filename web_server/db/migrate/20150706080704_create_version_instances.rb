class CreateVersionInstances < ActiveRecord::Migration
  def change
    create_table :version_instances do |t|
      t.string :VALUE
      t.text :EXPLAIN

      t.timestamps
    end
    add_index :version_instances, :VALUE
  end
end
