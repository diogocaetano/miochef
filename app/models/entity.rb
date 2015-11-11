class Entity < ActiveRecord::Base
  belongs_to :modules_category

  has_many :permissions, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :slug
  validates_presence_of :controller

  validates :name, uniqueness: true
  validates :controller, uniqueness: true
end
