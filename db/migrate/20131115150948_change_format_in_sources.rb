class ChangeFormatInSources < ActiveRecord::Migration
  def self.up
   change_column :books, :publication_date, :string
  end

  def self.down
   change_column :books, :publication_date, :integer
  end
end
