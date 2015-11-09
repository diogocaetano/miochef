class Permission < ActiveRecord::Base
  belongs_to :entity
  has_and_belongs_to_many :roles
end
