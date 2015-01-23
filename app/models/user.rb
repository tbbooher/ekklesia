class User < ActiveRecord::Base
  has_many :stances
  has_many :upvotes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
