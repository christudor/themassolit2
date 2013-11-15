class Essay < ActiveRecord::Base
  attr_accessible :lesson_id, :question
  belongs_to :lesson
end
