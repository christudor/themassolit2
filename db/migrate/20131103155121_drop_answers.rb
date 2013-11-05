class DropAnswers < ActiveRecord::Migration
  def up
    drop_table :answers
  end

  def down
    create_table :answers do |t|
      t.string :name

      t.timestamps        
    end
  end
end
