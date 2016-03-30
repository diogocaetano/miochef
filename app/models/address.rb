class Address < ActiveRecord::Base
  belongs_to :chef

  validates :public_place, presence: true
  validates :number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :complement, presence: true
  validates :chef_id, presence: true
end
