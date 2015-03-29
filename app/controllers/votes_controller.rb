class VotesController < ApplicationController
  include AuthsHelper
  include ErrorsHelper

  def create
    # [f, s] = Vote.calc_crazy_fs
    if logged_in?
      Vote.create(user_id: current_user.id, bill_id: params[:vote][:bill_id].to_i, direction: params[:commit])
    else
      set_error("Login to vote.")
    end
    redirect_to :root
  end
end