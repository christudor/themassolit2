class CreateTranscripts < ActiveRecord::Migration
  def change
    create_table :transcripts do |t|
      t.text :name
      t.integer :lesson_id
      t.string :transcript

      t.timestamps
    end
  end
end
