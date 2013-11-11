class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :lesson_id

      t.timestamps
    end
  end
end
