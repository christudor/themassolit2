class AddQualificationsToSubscribers < ActiveRecord::Migration
  def change
  	add_column :subscribers, :subject1, :string
  	add_column :subscribers, :subject2, :string
  	add_column :subscribers, :subject3, :string
  	add_column :subscribers, :subject4, :string
  	add_column :subscribers, :subject5, :string
  	add_column :subscribers, :subject6, :string
  	add_column :subscribers, :age, :integer
  	add_column :subscribers, :sex, :string
  end
end
