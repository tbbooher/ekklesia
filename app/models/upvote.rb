class Upvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :stance

  validates_presence_of :user_id, :stance_id

  validates_uniqueness_of :user_id, scope: :stance_id
end