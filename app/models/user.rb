class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :role

  has_many :addresses

  validates_presence_of :role_id, :name

  def access_token_expired?  	
  	self.token_expiration_time + 2.hours >= DateTime.now.in_time_zone
  end
end
