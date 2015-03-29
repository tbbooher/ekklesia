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
    if request.xhr?
      @user = current_user.to_json
    end
  end
end
