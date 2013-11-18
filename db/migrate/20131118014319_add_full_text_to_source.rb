class AddFullTextToSource < ActiveRecord::Migration
  def change
    add_column :sources, :fulltext, :text
  end
end
