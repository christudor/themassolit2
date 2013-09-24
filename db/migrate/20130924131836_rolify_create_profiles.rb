class RolifyCreateProfiles < ActiveRecord::Migration
  def change
    create_table(:profiles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:subscribers_profiles, :id => false) do |t|
      t.references :subscriber
      t.references :profile
    end

    add_index(:profiles, :name)
    add_index(:profiles, [ :name, :resource_type, :resource_id ])
    add_index(:subscribers_profiles, [ :subscriber_id, :profile_id ])
  end
end
