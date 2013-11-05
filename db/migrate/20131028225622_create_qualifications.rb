class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :board
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
