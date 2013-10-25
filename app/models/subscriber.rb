class Subscriber < ActiveRecord::Base
  resourcify
  rolify :role_cname => 'Profile'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :job, :school_id
  before_create :assign_role

  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false

  belongs_to :school
  has_many :relationships, foreign_key: "student_id", dependent: :destroy
  has_many :studied_courses, through: :relationships, source: :studied
  
  before_create :assign_role

  def assign_role
  # assign a default role if no role is assigned
  self.add_role :invalidteacher if self.job == "teacher"
  self.add_role :invalidstudent if self.job == "student"
  end

  def studying?(course)
    relationships.find_by_course_id(course.id)
  end

  def study!(course)
    relationships.create!(course_id: course.id)
  end

  def unstudy!(course)
    relationships.find_by_course_id(course.id).destroy
  end

end