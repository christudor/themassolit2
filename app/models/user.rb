class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  has_many :relationships, foreign_key: "student_id", dependent: :destroy
  has_many :studied_courses, through: :relationships, source: :course
  has_many :reverse_relationships, foreign_key: "course_id", class_name: "Relationship", dependent: :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  def studying?(course)
    relationships.find_by_course_id(course.id)
  end

  def study!(course)
    relationships.create!(course_id: course.id)
  end

  def unstudy!(course)
    relationships.find_by_course_id(course.id).destroy
  end
  
  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end