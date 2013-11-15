class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.text :question
      t.integer :lesson_id

      t.timestamps
    end
  end
end
