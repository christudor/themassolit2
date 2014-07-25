class ChangeColumnOnUsers < ActiveRecord::Migration
  def change
  	change_column :users, :rolable_type,  :string
  end

end
