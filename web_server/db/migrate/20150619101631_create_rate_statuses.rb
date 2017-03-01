class CreateRateStatuses < ActiveRecord::Migration
  def change
    create_table :rate_statuses do |t|
      t.integer :RATE_NO
      t.integer :USER_NO
      t.string :POISON_RATE
      t.string :SILENCE_RATE
      t.string :PARALYZE_RATE
      t.string :SLOW_RATE
      t.string :RESIST_POISON
      t.string :RESIST_SILENCE
      t.string :RESIST_PARALYZE
      t.string :RESIST_SLOW
      t.string :HP_STEAL_HIT
      t.string :MP_STEAL_HIT
      t.string :HP_STEAL_DAMAGE
      t.string :MP_STEAL_DAMAGE
      t.string :LAST_DATE

      t.timestamps
    end
  end
end
