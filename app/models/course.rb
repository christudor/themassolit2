class Course < ActiveRecord::Base
  attr_accessible :category, :description, :name, :provider_id, :avatar, :remote_avatar_url, :tag_list, :genre_list, :subgenre_list, :author_list, :text_list, :examoption_list, :theme_list
  acts_as_taggable
  acts_as_taggable_on :genres, :subgenres, :texts, :authors, :examoptions, :themes
  
  belongs_to :provider
  mount_uploader :avatar, AvatarUploader

  has_many :relationships
  has_many :students, through: :relationships, source: :student

  has_many :lessons, :order => 'title', :dependent => :destroy
  has_many :scores, :through => :lessons
  has_many :banners, :dependent => :destroy
  has_many :books, :through => :lessons
  has_many :essays, :through => :lessons
  has_many :sources, :through => :lessons
  has_many :trailers
  has_many :samples

  def avatar_name
  	File.basename(avatar.path || avatar.filename) if avatar
  end

end