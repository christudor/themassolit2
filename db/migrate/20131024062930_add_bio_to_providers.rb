class AddBioToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :bio, :text
  end
end
