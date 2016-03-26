class ChefType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :chefs
end
