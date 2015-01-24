class User < ActiveRecord::Base
  has_secure_password

  has_many :stances
  has_many :upvotes

  validates_uniqueness_of :email, :username
  validates_presence_of :first_name, :last_name, :email
end
