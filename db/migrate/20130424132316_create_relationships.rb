class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end

    add_index :relationships, :student_id
    add_index :relationships, :course_id
    add_index :relationships, [:student_id, :course_id], unique: true
  end
end
