class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.text :name
      t.integer :lesson_id
      t.text :correct_answer

      t.timestamps
    end
  end
end
