class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.string :name
      t.integer :course_id
      t.string :trailer

      t.timestamps
    end
  end
end
