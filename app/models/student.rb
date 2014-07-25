class Student < ActiveRecord::Base
  belongs_to :school
  attr_accessible :school_id
  has_one :user, :as => :rolable
  
end
