class Video < ActiveRecord::Base
  attr_accessible :lesson_id, :name
  validates :lesson_id, presence: true
  belongs_to :lesson
  mount_uploader :movie, MovieUploader

  def movie_name
    File.basename(movie.path || movie.filename) if movie
  end

end
