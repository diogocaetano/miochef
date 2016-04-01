class NutritionalTable < ActiveRecord::Base
	has_many :plate, dependent: :restrict_with_error
end
