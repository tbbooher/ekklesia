class Bill < ActiveRecord::Base
  require 'set'

  belongs_to :issue
  has_many :bill_votes
  has_many :legislators, through: :bill_votes
  has_many :breakdowns

  validates_presence_of :official_title

  def vote(user, value)
    Vote.create(user_id: current_user.id, bill_id: params[:bill_id], direction: params[:direction])
  end

  class << self

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