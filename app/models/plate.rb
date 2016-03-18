class Plate < ActiveRecord::Base
  # belongs_to :chef
  belongs_to :plate_type
  has_many :plate_badge
  has_and_belongs_to_many  :ingredients
  has_and_belongs_to_many  :plate_accompaniment
end
