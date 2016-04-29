class ChefRating < ActiveRecord::Base
  belongs_to :client
  belongs_to :chef

  validates :client_id, :chef_id, :score, :presence => true

  validate :client_already_rated_the_chef?

  def client_already_rated_the_chef?
  	errors.add('Cliente', 'Você já deu uma nota para este Chef') unless ChefRating::where('client_id = ? AND chef_id = ?', self.client_id, self.chef_id).first.nil?
  end
end
