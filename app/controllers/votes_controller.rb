class VotesController < ApplicationController
  include AuthsHelper

  def create
    # [f, s] = Vote.calc_crazy_fs
    Vote.create(user_id: current_user.id, bill_id: params[:vote][:bill_id].to_i, direction: params[:commit], social_score: s, fiscal_score: f)
    redirect_to :root
  end
end