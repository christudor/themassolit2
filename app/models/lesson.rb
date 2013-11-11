class Lesson < ActiveRecord::Base
  attr_accessible :lessondescription, :length, :title, :course_id, :lessonimage, :video, :transcript
  validates :course_id, presence: true
  belongs_to :course

  has_many :movies
  has_many :transcripts
  has_many :handouts

  has_one :quiz
  has_many :scores, :through => :quiz

    def previous
      Lesson.where("course_id = ? AND id < ?", self.course.id, self.id).first
    end

    def next
      Lesson.where("course_id = ? AND id > ?", self.course.id, self.id).first
    end

end
