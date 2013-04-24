class Relationship < ActiveRecord::Base
  attr_accessible :course_id

  belongs_to :student, class_name: "User"
  belongs_to :course

  validates :student_id, presence: true
  validates :course_id, presence: true
end
