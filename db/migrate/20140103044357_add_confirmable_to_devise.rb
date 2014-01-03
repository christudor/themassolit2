class AddConfirmableToDevise < ActiveRecord::Migration
  def self.up
    add_column :subscribers, :confirmation_token, :string
    add_column :subscribers, :confirmed_at,       :datetime
    add_column :subscribers, :confirmation_sent_at , :datetime
    add_column :subscribers, :unconfirmed_email, :string

    add_index  :subscribers, :confirmation_token, :unique => true
  end
  def self.down
    remove_index  :subscribers, :confirmation_token

    remove_column :subscribers, :unconfirmed_email
    remove_column :subscribers, :confirmation_sent_at
    remove_column :subscribers, :confirmed_at
    remove_column :subscribers, :confirmation_token
  end
end