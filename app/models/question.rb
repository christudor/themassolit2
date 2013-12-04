class Question < ActiveRecord::Base
  attr_accessible :question, :quiz_id, :answers_attributes, :correct_answer, :correct_explanation, :incorrect_explanation
  belongs_to :quiz
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
end
