class RemoveTranscriptFromLessons < ActiveRecord::Migration
  def up
    remove_column :lessons, :transcript
  end

  def down
    add_column :lessons, :transcript, :string
  end
end
