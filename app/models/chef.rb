class Chef < ActiveRecord::Base
  belongs_to :country
  has_many :addresses
  has_many :badges

  validates :name, presence: true
  validates :cpf, presence: true
  validates :rg, presence: true
  validates :born_date, presence: true
  validates :country_id, presence: true
  validates :email, presence: true
  validates :specialty, presence: true
  validates :naturalness, presence: true
  validates :academic_education, presence: true
  validates :university, presence: true

end
