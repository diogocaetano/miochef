class Country < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :initials, presence: true, uniqueness: true
	has_many :chefs
end
