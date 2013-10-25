class AddTwitterToProviders < ActiveRecord::Migration
  def change
  	add_column :providers, :facebook, :string
  	add_column :providers, :twitter, :string
  	add_column :providers, :googleplus, :string
  	add_column :providers, :blog, :string
  end
end
