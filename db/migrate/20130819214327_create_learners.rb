class CreateLearners < ActiveRecord::Migration
  def change
    create_table :learners do |t|
      t.string :email

      t.timestamps
    end
  end
end
