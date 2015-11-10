class Role < ActiveRecord::Base
	has_and_belongs_to_many :permissions
	has_many :users, dependent: :restrict_with_exception
	
	validates_presence_of :name
end
