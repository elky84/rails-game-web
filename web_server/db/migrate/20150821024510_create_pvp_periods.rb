class CreatePvpPeriods < ActiveRecord::Migration
  def change
    create_table :pvp_periods do |t|
      t.integer :PVP_PERIOD_ID
      t.integer :SEASON_NUM
      t.timestamp :START_DATE
      t.timestamp :END_DATE

      t.timestamps
    end
    add_index :pvp_periods, :PVP_PERIOD_ID
  end
end
