class ModulesCategory < ActiveRecord::Base
	has_many :entities, dependent: :restrict_with_exception

	validates_presence_of :name, :icon
end
