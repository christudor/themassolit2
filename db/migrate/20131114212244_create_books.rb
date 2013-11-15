class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :title
      t.string :author
      t.integer :publication_date
      t.string :amazon
      t.text :comment
      t.integer :lesson_id

      t.timestamps
    end
  end
end
