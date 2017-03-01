class AddMailTypeToMailInstances < ActiveRecord::Migration
  def change
    add_column :mail_instances, :MAIL_TYPE, :string
  end
end
