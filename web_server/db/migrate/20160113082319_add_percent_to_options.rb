class AddPercentToOptions < ActiveRecord::Migration
  def change
    add_column :options, :PERCENT, :integer
  end
end
