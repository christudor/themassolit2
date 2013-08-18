class Lesson < ActiveRecord::Base
  attr_accessible :lessondescription, :length, :title, :course_id
  validates :course_id, presence: true
  belongs_to :course
end
