class Handout < ActiveRecord::Base
  attr_accessible :handout, :lesson_id, :name
  validates :lesson_id, presence: true
  belongs_to :lesson
  mount_uploader :transcript, TranscriptUploader

  def handout_name
    File.basename(handout.path || handout.filename) if handout
  end

end
