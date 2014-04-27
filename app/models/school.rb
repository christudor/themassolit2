class School < ActiveRecord::Base
  attr_accessible :name, :active
  has_many :subscribers
  has_many :teachers
  

end
