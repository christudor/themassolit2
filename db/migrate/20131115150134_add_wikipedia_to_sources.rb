class AddWikipediaToSources < ActiveRecord::Migration
  def change
    add_column :sources, :wikipedia, :string
  end
end
