class User < ActiveRecord::Base
  email_format = /\b[A-Z0-9._%-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}\b/i
  has_secure_password

  has_many :stances
  has_many :upvotes
  has_many :donations

  validates_uniqueness_of :username
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true, format: email_format

  def fetch_stances(num)
    stances.shuffle.slice(0..num)
  end
end
