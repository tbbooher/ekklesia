class Bill < ActiveRecord::Base
  has_many :bill_votes
  has_many :politicians, through: :bill_votes
end