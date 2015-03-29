class WelcomeController < ApplicationController
  include AuthsHelper

  def index
    @bills = logged_in? ? Bill.not_voted_on(current_user) : Bill.all
    @bill = @bills[0]
    @vote = Vote.new(bill: @bill)
    render layout: 'welcome'
  end

  def create
  end
end
