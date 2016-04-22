class PlateRating < ActiveRecord::Base
  belongs_to :client
  belongs_to :plate

  validates :client_id, :plate_id, :score, :presence => true

  validate :client_already_rated_the_plate?

  def client_already_rated_the_plate?
  	errors.add('Cliente', 'já deu nota para este Prato') unless PlateRating::where('client_id = ? AND plate_id = ?', self.client_id, self.plate_id).first.nil?
  end
end
