class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.text :description
      t.string :banner
      t.integer :course_id

      t.timestamps
    end
  end
end
