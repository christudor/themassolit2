class Subscriber < ActiveRecord::Base
  resourcify
  rolify :role_cname => 'Profile'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :job
  before_create :assign_role

  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false

  before_create :assign_role

  def assign_role
  # assign a default role if no role is assigned
  self.add_role :invalidteacher if self.job == "teacher"
  self.add_role :invalidstudent if self.job == "student"
  end
end
