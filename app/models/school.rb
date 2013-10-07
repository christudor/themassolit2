class School < ActiveRecord::Base
  attr_accessible :name
  has_many :subscribers
  has_many :teachers
  

end
