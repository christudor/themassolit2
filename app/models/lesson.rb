class Lesson < ActiveRecord::Base
  attr_accessible :lessondescription, :length, :title, :course_id, :lessonimage
  validates :course_id, presence: true
  belongs_to :course
  mount_uploader :lessonimage, LessonimageUploader

    def lessonimage_name
  		File.basename(lessonimage.path || lessonimage.filename) if lessonimage
  	end

end
