class AddSchoolIdToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :school_id, :integer
  end
end
