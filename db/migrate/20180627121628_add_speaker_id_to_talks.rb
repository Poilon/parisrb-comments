class AddSpeakerIdToTalks < ActiveRecord::Migration[5.1]
  def change
    add_column :talks, :speaker_id, :uuid
  end
end
