class PlateRating < ActiveRecord::Base
  belongs_to :client
  belongs_to :plate

  validates :client_id, :plate_id, :score, :presence => true
end
