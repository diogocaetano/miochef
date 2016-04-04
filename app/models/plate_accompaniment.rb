class PlateAccompaniment < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true

	has_and_belongs_to_many :plates
	before_destroy :has_plates?

	def has_plates?
		if self.plates.any? 
			errors.add(:base, I18n.t('errors.messages.restrict_dependent_destroy.one'))
			return false
		end
	end
end
