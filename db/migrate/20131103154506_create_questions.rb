class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :quiz_id

      t.timestamps
    end
  end
end
