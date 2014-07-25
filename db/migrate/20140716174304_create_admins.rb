class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.boolean :admin

      t.timestamps
    end
  end
end
