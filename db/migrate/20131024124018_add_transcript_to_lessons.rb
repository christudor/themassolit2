class AddTranscriptToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :transcript, :string
  end
end
