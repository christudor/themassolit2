class Transcript < ActiveRecord::Base
  attr_accessible :lesson_id, :name, :transcript
  validates :lesson_id, presence: true
  belongs_to :lesson
  mount_uploader :transcript, TranscriptUploader

  def transcript_name
    File.basename(transcript.path || transcript.filename) if transcript
  end

end
