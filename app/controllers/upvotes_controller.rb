class UpvotesController < ApplicationController

  def create
    existing_upvote = Upvote.find_by(upvote_params)
    upvote = Upvote.new(upvote_params)
    if upvote.save
      redirect_to stance_path(upvote.stance.id)
    else
      set_error('Login to upvote.')
      redirect_to '/login'
    end
  end

  def upvote_params
    params.require(:upvote).permit(:user_id, :stance_id)
  end
end
