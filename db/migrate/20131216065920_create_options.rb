class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :name
      t.string :ref
      t.string :board

      t.timestamps
    end
  end
end
