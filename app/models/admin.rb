class Admin < ActiveRecord::Base
  attr_accessible :admin
  has_one :user, :as => :rolable

end
