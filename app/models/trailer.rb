class Trailer < ActiveRecord::Base
  attr_accessible :course_id, :name, :trailer
  validates :course_id, presence: true
  belongs_to :course
  mount_uploader :trailer, TrailerUploader

  def trailer_name
    File.basename(trailer.path || trailer.filename) if trailer
  end

end
