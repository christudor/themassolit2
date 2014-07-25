class DropTeachersTabble < ActiveRecord::Migration
  def change
  	drop_table :teachers
  end

end
