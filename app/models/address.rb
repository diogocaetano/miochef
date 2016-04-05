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

  before_save :update_main_address

  def main?
  	self.main
  end

private
  
  def update_main_address
    Address.where(chef_id: self.chef_id).update_all(main: false) if self.main
    self.main = true
  end

end
