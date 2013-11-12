class Banner < ActiveRecord::Base
  attr_accessible :banner, :course_id, :description, :name
  validates :course_id, presence: true
  belongs_to :course
  mount_uploader :banner, BannerUploader

  def banner_name
    File.basename(banner.path || banner.filename) if banner
  end

end
