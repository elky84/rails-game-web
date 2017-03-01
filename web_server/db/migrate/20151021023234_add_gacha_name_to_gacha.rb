class AddGachaNameToGacha < ActiveRecord::Migration
  def change
    add_column :gachas, :GACHA_NAME, :string
  end
end
