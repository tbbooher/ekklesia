class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :stance
  belongs_to :legislator
end