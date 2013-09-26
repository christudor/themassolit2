class AddJobToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :job, :string
  end
end
