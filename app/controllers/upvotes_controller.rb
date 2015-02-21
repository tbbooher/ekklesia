class UpvotesController < ApplicationController
  include AuthsHelper
  include ErrorsHelper
  def create
    existing_upvote = Upvote.find_by(user_id: current_user.id, stance_id: params[:id])

    upvote = current_user.upvotes.new(stance_id: params[:id])

    if existing_upvote
      redirect_to :back
    elsif upvote.save
      render json: Stance.find(params[:id]).upvotes.count
    elsif !logged_in?
      set_error('Login to upvote.')
      redirect_to '/login'
    end
  end

end
