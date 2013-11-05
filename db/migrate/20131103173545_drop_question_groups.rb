class DropQuestionGroups < ActiveRecord::Migration
  def up
    drop_table :question_groups
  end

  def down
    create_table :question_groups do |t|
      t.string :name

      t.timestamps        
    end
  end
end
