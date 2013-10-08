class AddDepartmentToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :position, :string
    add_column :providers, :department, :string
    add_column :providers, :college, :string
    add_column :providers, :university, :string
  end
end
