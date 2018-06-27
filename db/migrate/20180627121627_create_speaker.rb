class CreateSpeaker < ActiveRecord::Migration[5.1]
  def change
    create_table :speakers, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
  end
end
