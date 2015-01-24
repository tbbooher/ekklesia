class Stance < ActiveRecord::Base
  belongs_to :user
  belongs_to :position
  has_many :upvotes
  has_many :legislator_stances
  has_many :legislators, through: :legislator_stances

  validates_presence_of :user_id, :position_id

  def info
    { position_description: Position.find(position_id).description,
    author: User.find(user_id) }
  end

  def self.search(words)
    words.split(' ').map do |word|
      Stance.all.select do |s|
        position = Position.find(s.position_id)
        issue = Issue.find(position.issue_id)
        position.description.downcase.include?(word.downcase) || issue.description.downcase.include?(word.downcase)
      end
    end.flatten.uniq
  end
end