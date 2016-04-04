class PlateBadge < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true, uniqueness: true
	validates :image, presence: true
	has_attached_file :image, styles: { medium: "300x300>", thumb: "64x64>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates_attachment_size :image, less_than: 2.megabytes
	has_and_belongs_to_many :plates
	before_destroy :has_plates?

	def has_plates?
		if self.plates.any? 
			errors.add(:base, I18n.t('errors.messages.restrict_dependent_destroy.one'))
			return false
		end
	end
end
