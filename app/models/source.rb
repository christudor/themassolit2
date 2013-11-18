class Source < ActiveRecord::Base
  attr_accessible :date, :lesson_id, :link, :name, :wikipedia, :fulltext, :reference
  belongs_to :lesson
end
