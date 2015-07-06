class User < ActiveRecord::Base
   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :gender
  belongs_to :role
  has_many :tutor_details
  has_many :class_details

  # attr_accessor :login

# or if you will use this variable somewhere else in the code:

  # def login=(login)
  #   @login = login
  # end

  # def login
  #   @login || self.username || self.email
  # end
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
  def admin?
    
  end
end
