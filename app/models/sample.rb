class Sample < ActiveRecord::Base
  attr_accessible :course_id, :name, :sample
  validates :course_id, presence: true
  belongs_to :course
  mount_uploader :sample, SampleUploader

  def sample_name
    File.basename(sample.path || sample.filename) if sample
  end

end
