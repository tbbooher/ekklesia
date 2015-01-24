class Alias < ActiveRecord::Base
  belongs_to :politician
  validates_presence_of :politician_id
end