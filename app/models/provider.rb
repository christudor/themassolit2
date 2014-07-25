class Provider < ActiveRecord::Base
  attr_accessible :name, :position, :department, :college, :university, :email,
  :bio, :facebook, :twitter, :googleplus, :blog, :academiaedu, :huffpo, :website
  has_many :courses

  before_save { |provider| provider.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
