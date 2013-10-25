class AddAcademiaToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :academiaedu, :string
    add_column :providers, :huffpo, :string
  end
end
