class WelcomeController < ApplicationController
  include AuthsHelper

  def index
    @bills = Bill.not_voted_on(current_user)
    @bill = @bills[0]
    @vote = Vote.new(bill: @bill)
    render layout: 'welcome'
  end

  # def create
  #
  # end
end
