class User < ActiveRecord::Base
  email_format = /\b[A-Z0-9._%-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}\b/i
  has_secure_password

  has_many :votes
  has_many :bills, through: :votes

  validates_uniqueness_of :username
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true, format: email_format


  # TODO: implement when survey provided
  # def calc_score(type,a)
  #   1.upto(5).map{|k| a["#{type}#{k}"].to_i}.sum
  # end

  # def update_score(p)
  #   social, fiscal = [calc_score('fiscal', p), calc_score('social', p)]
  #   self.update_attributes!(social_score: social, fiscal_score: fiscal)
  #   [social, fiscal]
  # end
end
