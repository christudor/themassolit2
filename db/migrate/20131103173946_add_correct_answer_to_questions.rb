class AddCorrectAnswerToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :correct_answer, :text
  end
end
