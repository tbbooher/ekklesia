class Stance < ActiveRecord::Base
  belongs_to :user
  belongs_to :position
  has_many :upvotes
  has_many :legislator_stances
  has_many :legislators, through: :legislator_stances
  has_many :donations

  validates_presence_of :user_id, :position_id

  def info
    { position_description: Position.find(position_id).description,
    author: User.find(user_id) }
  end

  def voted(user_id)
    self.upvotes.find_by(user_id: user_id) ? true : false
  end

  def self.search(words)
    case words
    when "Popular"
      Upvote.group(:stance_id).count.sort_by{|_,v|v}.reverse.map{|pair| Stance.find(pair[0])}
    when "Recent"
      Stance.all.order("created_at DESC")[0..20]
    else
      words.split(' ').map do |word|
        Stance.all.select do |s|
          s.position.description.downcase.include?(word.downcase) || s.position.issue.description.downcase.include?(word.downcase)
        end
      end.flatten.uniq
    end
  end
end