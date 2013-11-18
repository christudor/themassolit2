class AddReferenceToSource < ActiveRecord::Migration
  def change
    add_column :sources, :reference, :text
  end
end
