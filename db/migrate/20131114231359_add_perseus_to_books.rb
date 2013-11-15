class AddPerseusToBooks < ActiveRecord::Migration
  def change
    add_column :books, :perseus, :string
  end
end
