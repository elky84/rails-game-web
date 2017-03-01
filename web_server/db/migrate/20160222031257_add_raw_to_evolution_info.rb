class AddRawToEvolutionInfo < ActiveRecord::Migration
  def change
    add_column :evolution_infos, :RAW, :integer
  end
end
