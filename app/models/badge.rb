class Badge < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true, uniqueness: true
	has_attached_file :image, styles: { medium: "300x300>", thumb: "64x64>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	has_and_belongs_to_many :chefs
end