class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :name
      t.integer :course_id
      t.string :sample

      t.timestamps
    end
  end
end
