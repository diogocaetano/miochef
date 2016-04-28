class Plate < ActiveRecord::Base

	attr_accessor :quantity
	# belongs_to :chef
	belongs_to :plate_type
	belongs_to :chef
	belongs_to :nutritional_table
	has_and_belongs_to_many :plate_badges
	has_and_belongs_to_many  :ingredients, dependent: :restrict_with_error
	has_and_belongs_to_many  :plate_accompaniments
	
	has_many :request_plates, :inverse_of => :plate
	has_many :requests, :through => :request_plates

	validates :title, presence: true, uniqueness: true
	validates :plate_type_id, presence: true
	validates :description, presence: true, uniqueness: true
	validates :chef_id, presence: true
	validates :photo, presence: true
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "64x64>" }
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	validates_attachment_size :photo, less_than: 2.megabytes

	accepts_nested_attributes_for :nutritional_table
	accepts_nested_attributes_for :ingredients
	accepts_nested_attributes_for :plate_badges
	accepts_nested_attributes_for :plate_accompaniments
	accepts_nested_attributes_for :requests
	accepts_nested_attributes_for :request_plates
end
