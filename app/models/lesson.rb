class Lesson < ActiveRecord::Base
  attr_accessible :lessondescription, :length, :title, :course_id, :lessonimage, :video, :transcript
  validates :course_id, presence: true
  belongs_to :course

  has_many :movies, :dependent => :destroy
  has_many :transcripts, :dependent => :destroy
  has_many :handouts, :dependent => :destroy
  has_many :books, :dependent => :destroy
  has_many :essays, :dependent => :destroy
  has_many :sources, :dependent => :destroy

  has_one :quiz, :dependent => :destroy
  has_many :scores, :through => :quiz

    def previous
      Lesson.where("course_id = ? AND id < ?", self.course.id, self.id).first
    end

    def next
      Lesson.where("course_id = ? AND id > ?", self.course.id, self.id).first
    end

end
