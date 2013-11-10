class Lesson < ActiveRecord::Base
  attr_accessible :lessondescription, :length, :title, :course_id, :lessonimage, :video, :transcript
  validates :course_id, presence: true
  belongs_to :course
  has_many :transcripts
  has_many :handouts

  has_one :quiz
  has_many :scores, :through => :quiz
  
  mount_uploader :lessonimage, LessonimageUploader
  mount_uploader :video, VideoUploader

    def lessonimage_name
  		File.basename(lessonimage.path || lessonimage.filename) if lessonimage
  	end

  	def video_name
  		File.basename(video.path || video.filename) if video
  	end

    def previous
      Lesson.where("course_id = ? AND id < ?", self.course.id, self.id).first
    end

    def next
      Lesson.where("course_id = ? AND id > ?", self.course.id, self.id).first
    end

end
