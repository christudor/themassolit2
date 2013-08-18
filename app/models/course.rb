class Course < ActiveRecord::Base
  attr_accessible :category, :description, :name, :provider_id
  validates :provider_id, presence: true
  belongs_to :provider

  has_many :relationships
  has_many :lessons

end