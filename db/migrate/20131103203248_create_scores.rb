class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score
      t.integer :percentage
      t.integer :subscriber_id
      t.integer :quiz_id

      t.timestamps
    end
  end
end
