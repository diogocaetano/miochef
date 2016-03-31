class PlateType < ActiveRecord::Base
	has_many :plate, dependent: :restrict_with_error
	validates :name, presence: true, uniqueness: true
end
