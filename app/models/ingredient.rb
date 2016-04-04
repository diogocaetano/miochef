class Ingredient < ActiveRecord::Base
	has_and_belongs_to_many  :plates, dependent: :restrict_with_error

	validates :name, presence: true, uniqueness: true
	# validate :has_plates?, on: :destroy
	before_destroy :has_plates?

	private

	def has_plates?
		if self.plates.any? 
			errors.add(:base, I18n.t('errors.messages.restrict_dependent_destroy.one'))
			return false
		end
	end
end
