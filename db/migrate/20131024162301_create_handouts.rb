class CreateHandouts < ActiveRecord::Migration
  def change
    create_table :handouts do |t|
      t.text :name
      t.integer :lesson_id
      t.string :handout

      t.timestamps
    end
  end
end
