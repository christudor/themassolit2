class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.text :name
      t.string :date
      t.string :link
      t.integer :lesson_id

      t.timestamps
    end
  end
end
