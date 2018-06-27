class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.string :body
      t.uuid :spectator_id
      t.uuid :talk_id
      t.timestamps
    end
  end
end
