class AddVoiceToActorStatusScripts < ActiveRecord::Migration
  def change
    add_column :actor_status_scripts, :VOICE, :string
  end
end
