class AddSectionToBooks < ActiveRecord::Migration
  def change
    add_column :books, :section, :string
  end
end
