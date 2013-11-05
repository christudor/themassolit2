class DropQuizzes < ActiveRecord::Migration
  def up
    drop_table :quizzes
  end

  def down
    create_table :quizzes do |t|
      t.string :name

      t.timestamps        
    end
  end
end
