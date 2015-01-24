class User < ActiveRecord::Base
  has_many :stances
  has_many :upvotes
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email

end
