class CreateScenarioScripts < ActiveRecord::Migration
  def change
    create_table :scenario_scripts do |t|
      t.integer :INDEX
      t.string :DIALOGUE_TYPE
      t.string :DIALOGUE_EFFECT
      t.string :SPEECH_BACK
      t.string :CHARACTER_FACE
      t.string :FACE_POS
      t.integer :CHARACOTR_INDEX
      t.integer :STRING_INDEX

      t.timestamps
    end
  end
end
