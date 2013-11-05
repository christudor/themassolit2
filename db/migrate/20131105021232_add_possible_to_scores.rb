class AddPossibleToScores < ActiveRecord::Migration
  def change
    add_column :scores, :possible, :integer
  end
end
