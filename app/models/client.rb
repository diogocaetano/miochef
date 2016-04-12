class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "inválido")
    end
  end
end

class Client < ActiveRecord::Base
  has_many :addresses

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true
  validates :cep, presence: true
end
