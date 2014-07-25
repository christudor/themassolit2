class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :school_id

      t.timestamps
    end
  end
end
