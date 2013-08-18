class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :lessons, :description, :lessondescription
  end
end
