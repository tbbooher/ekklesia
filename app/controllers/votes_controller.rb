class VotesController < ApplicationController
  include AuthsHelper
  include ErrorsHelper

  def create
    if logged_in?
      @bill = Bill.find(params[:vote][:bill_id].to_i)
      Vote.create(user_id: current_user.id, bill_id: @bill.id, direction: params[:commit])
      @bill.rescore

    else
      set_error("Login to vote.")
    end
    redirect_to :root
  end
end