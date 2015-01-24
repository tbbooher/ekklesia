class Term < ActiveRecord::Base
  belongs_to :legislator
  validates_presence_of :legislator_id
end