class AddLessonimageToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lessonimage, :string
  end
end
