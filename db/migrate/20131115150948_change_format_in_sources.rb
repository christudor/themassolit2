class ChangeFormatInSources < ActiveRecord::Migration
  def self.up
   change_column :books, :date, :string
  end

  def self.down
   change_column :books, :date, :integer
  end
end
