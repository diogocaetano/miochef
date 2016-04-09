class PortalBanner < ActiveRecord::Base
	validates :image, :title, presence: true
	has_attached_file :image, styles: { large:"600x600", medium: "300x300>", thumb: "64x64>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates_attachment_size :image, less_than: 2.megabytes

end
