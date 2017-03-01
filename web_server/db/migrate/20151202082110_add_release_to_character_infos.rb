class AddReleaseToCharacterInfos < ActiveRecord::Migration
  def change
    add_column :character_infos, :RELEASE, :integer
  end
end
