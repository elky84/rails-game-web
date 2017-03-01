class CreateEvolutionInfos < ActiveRecord::Migration
  def change
    create_table :evolution_infos do |t|
      t.integer :EVOLUTION_ID
      t.integer :GRADE
      t.text :SPECIAL_MONSTER_LIST
      t.text :SPECIAL_SKILL_LIST
      t.text :RESULT
      t.text :RESULT_PERCENT
      t.integer :PRICE_COIN
      t.integer :PRICE_DIAMOND
      t.text :EVOLUTION_EVENT_TYPE
      t.integer :PERCENT_UP
      t.timestamp :START_DATE_TIME
      t.timestamp :END_DATE_TIME

      t.timestamps
    end
    add_index :evolution_infos, :EVOLUTION_ID
  end
end
