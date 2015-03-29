class Bill < ActiveRecord::Base
  require 'set'

  has_many :votes
  has_many :users, through: :votes

  def vote(user, value)
    Vote.create(user_id: current_user.id, bill_id: params[:bill_id], direction: params[:direction])
  end

  def rescore #TODO: account for nay votes
    if users.empty?
      fiscal_vote_score = 0
      social_vote_score = 0
    else
      fiscal_vote_score = users.map {|u| u.fiscal_mean}.inject(:+)
      social_vote_score = users.map {|u| u.social_mean}.inject(:+)
    end

    fiscal_rescore = fiscal_vote_score / users.count
    social_rescore = social_vote_score / users.count

    update(fiscal_mean: fiscal_rescore)
    update(social_mean: social_rescore)
  end

  # TODO: method to calculate fiscal/social variance?

  class << self
    def not_voted_on(user)
       Bill.all - user.bills
    end

    def rand_n(n, max)
      randoms = Set.new
      loop do
        randoms << (rand(max)+1)
        return randoms.to_a if randoms.size >= n
      end
    end

    def show_10
      rand_n(10,20).map{|n| Bill.find(n)}
    end
  end
end