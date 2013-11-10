class Quiz < ActiveRecord::Base
  attr_accessible :lesson_id, :name, :questions_attributes
  belongs_to :lesson
  has_many :questions
  has_many :scores
  has_many :subscribers, :through => :scores
  accepts_nested_attributes_for :questions, allow_destroy: true
end
