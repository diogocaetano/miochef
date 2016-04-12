class Address < ActiveRecord::Base
  belongs_to :chef
  belongs_to :client

  validates :public_place, presence: true
  validates :number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :chef_id, presence: true, if: Proc.new { |a| a.client_id.blank? }
  validates :client_id, presence: true, if: Proc.new { |a| a.chef_id.blank? }

  before_save :update_main_address
  before_destroy :allow_destroy?

  def main?
  	self.main
  end

private
  
  def update_main_address
    if self.main
      if not self.chef_id.blank?
        Address.where(chef_id: self.chef_id).where.not(id: self.id).update_all(main: false)
      elsif not self.client_id.blank?
        Address.where(client_id: self.client_id).where.not(id: self.id).update_all(main: false)
      end
    end
  end

  def allow_destroy?
    if self.main 
      errors.add('-', 'Não é possível remover um endereço principal.')
      return false
    end 
  end
end
