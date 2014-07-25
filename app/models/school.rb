class School < ActiveRecord::Base
  attr_accessible :name, :active
  has_many :students
  has_many :teachers
  
end
