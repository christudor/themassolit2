class Course < ActiveRecord::Base
  attr_accessible :category, :description, :name, :provider_id, :avatar, :remote_avatar_url
  belongs_to :provider
  mount_uploader :avatar, AvatarUploader

  has_many :relationships
  has_many :students, through: :reverse_relationships, source: :student

  has_many :lessons, :order => 'title', :dependent => :destroy
  has_many :scores, :through => :lessons
  has_many :banners, :dependent => :destroy
  has_many :books, :through => :lessons
  has_many :essays, :through => :lessons
  has_many :sources, :through => :lessons

  def avatar_name
  	File.basename(avatar.path || avatar.filename) if avatar
  end

  def self.all_categories
    find_by_sql("SELECT category FROM courses GROUP BY category").map(&:category).select {|x| x}
  end

  def self.select(category)
    if category
      find_all_by_category(category)
    else
      find :all
    end
  end

end