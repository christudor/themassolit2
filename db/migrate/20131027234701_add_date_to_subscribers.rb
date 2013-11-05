class AddDateToSubscribers < ActiveRecord::Migration
  def change
  	add_column :subscribers, :date_of_birth, :date
  end
end
