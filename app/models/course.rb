class Course < ActiveRecord::Base
  attr_accessible :category, :description, :name, :provider_id, :avatar, :remote_avatar_url
  belongs_to :provider
  mount_uploader :avatar, AvatarUploader

  has_many :relationships
  has_many :lessons

  def avatar_name
  	File.basename(avatar.path || avatar.filename) if avatar
  end

end