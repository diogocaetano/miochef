class ChefRating < ActiveRecord::Base
  belongs_to :client
  belongs_to :chef

  validates :client_id, :chef_id, :score, :presence => true
end
