class Lesson < ActiveRecord::Base
  attr_accessible :description, :length, :title
  validates :provider_id, presence: true
  belongs_to :course

  has_many :relationships
end
