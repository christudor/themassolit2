class Profile < ActiveRecord::Base
  has_and_belongs_to_many :subscribers, :join_table => :subscribers_profiles
  belongs_to :resource, :polymorphic => true
  
  scopify
end
