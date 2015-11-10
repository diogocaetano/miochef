class Permission < ActiveRecord::Base
  belongs_to :entity
  has_and_belongs_to_many :roles

  validates_presence_of :action, :action_name, :entity_id
end
