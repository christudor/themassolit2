class AddBirthdaytoSubscribers < ActiveRecord::Migration
 def change
  	add_column :subscribers, :birthday, :integer
  	add_column :subscribers, :birthmonth, :string
  	add_column :subscribers, :birthyear, :integer
  end
end
