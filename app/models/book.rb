class Book < ActiveRecord::Base
  attr_accessible :amazon, :author, :comment, :lesson_id, :publication_date, :title, :section, :perseus
  belongs_to :lesson


end
