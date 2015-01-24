class Stance < ActiveRecord::Base
  belongs_to :user
  belongs_to :position
  has_many :upvotes
  has_many :politician_stances
  has_many :politicians, through: :politician_stances

  validates_presence_of :user_id, :position_id

  def info
    { position_description: Position.find(position_id).description,
    author: User.find(user_id) }
  end
end