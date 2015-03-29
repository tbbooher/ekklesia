class WelcomeController < ApplicationController
  include AuthsHelper

  def index
    @bills = logged_in? ? Bill.not_voted_on(current_user) : Bill.all
    if @bills[0]
      @bill = @bills[0]
    end
    @voted_bills = current_user.bills if logged_in?
    @vote = Vote.new(bill: @bill)
    render layout: 'welcome'
  end

  def ajax
    # @bills = logged_in? ? Bill.not_voted_on(current_user) : Bill.all
    @bills = Bill.all
    user = current_user.to_json
    bill = @bills[0].to_json
    bill_voters = @bills[0].users.to_json
    render json: {user: user, bill: bill, bill_voters: bill_voters}
  end
end
