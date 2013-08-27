class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  def studying?(course)
    relationships.find_by_course_id(course.id)
  end

  def study!(course)
    relationships.create!(course_id: course.id)
  end

  def unstudy!(course)
    relationships.find_by_course_id(course.id).destroy
  end

  def assign_role
    # assign a default role if no role is assigned
    self.add_role :user if self.roles.first.nil?
  end
  
  def update_stripe
  return if email.include?(ENV['ADMIN_EMAIL'])
  return if email.include?('@example.com') and not Rails.env.production?
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end