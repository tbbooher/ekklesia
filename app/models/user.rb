class User < ActiveRecord::Base
  has_many :stances
  has_many :upvotes

  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email

end
