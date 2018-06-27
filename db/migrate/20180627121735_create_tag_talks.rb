class CreateTagTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_talks, id: :uuid do |t|
      t.uuid :tag_id
      t.uuid :talk_id

      t.timestamps
    end
  end
end
