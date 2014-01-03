class Score < ActiveRecord::Base
  attr_accessible :percentage, :quiz_id, :score, :subscriber_id, :user_id, :possible
  belongs_to :quiz
  belongs_to :subscriber
  belongs_to :user

end
