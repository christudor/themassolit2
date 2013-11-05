class Score < ActiveRecord::Base
  attr_accessible :percentage, :quiz_id, :score, :subscriber_id, :possible
  belongs_to :quiz
  belongs_to :subscriber

end
