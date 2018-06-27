class CreateTalk < ActiveRecord::Migration[5.1]
  def change
    create_table :talks, id: :uuid do |t|
      t.string :title
      t.timestamps
    end
  end
end
