class AddExplanationToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :correct_explanation, :text
    add_column :questions, :incorrect_explanation, :text
  end
end
