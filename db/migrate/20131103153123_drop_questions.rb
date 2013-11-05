class DropQuestions < ActiveRecord::Migration
  def up
    drop_table :questions
  end

  def down
    create_table :questions do |t|
      t.string :name

      t.timestamps        
    end
  end
end
