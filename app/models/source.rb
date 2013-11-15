class Source < ActiveRecord::Base
  attr_accessible :date, :lesson_id, :link, :name, :wikipedia
  belongs_to :lesson
end
