class Chef < ActiveRecord::Base
  has_many :plates, dependent: :restrict_with_error
  belongs_to :country
  belongs_to :chef_type
  has_many :addresses
  has_and_belongs_to_many :badges

  validates :chef_type_id, presence: true
  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :rg, presence: true, uniqueness: true
  validates :born_date, presence: true
  validates :country_id, presence: true
  validates :email, presence: true, uniqueness: true
  validates :specialty, presence: true
  validates :naturalness, presence: true
  validates :academic_education, presence: true
  validates :university, presence: true
  validates :photo, presence: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "64x64>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :photo, less_than: 2.megabytes

  def active?
    return 'Sim' if self.active
    'Não'
  end
end
