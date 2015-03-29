class Bill < ActiveRecord::Base
  require 'set'

  def vote(user, value)
    Vote.create(user_id: current_user.id, bill_id: params[:bill_id], direction: params[:direction])
  end

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