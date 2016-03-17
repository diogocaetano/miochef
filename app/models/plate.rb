class Plate < ActiveRecord::Base
  belongs_to :chef
  belongs_to :plate_type
  belongs_to :plate_badge
  belongs_to :ingredients
  belongs_to :plate_accompaniment
end
