class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :customer_id
      t.string :last_4_digits

      t.timestamps
    end
  end
end
