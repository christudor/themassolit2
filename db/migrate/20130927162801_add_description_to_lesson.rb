class AddDescriptionToLesson < ActiveRecord::Migration
  def change
  	change_column :lessons, :lessondescription, :text, :limit => nil
  end
end
