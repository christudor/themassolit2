class AddRolableToUsers < ActiveRecord::Migration
def change
    add_column :users, :rolable_id, :integer
    add_column :users, :rolable_type, :integer 
    add_column :users, :user_type, :string 
end
end
