class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :category
      t.string :description
      t.integer :provider_id

      t.timestamps
    end
  end
end
