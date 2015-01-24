class UpvotesController < ApplicationController
  def create
    upvote = Upvote.new(upvote_params)
    if upvote.save
      redirect_to root_path
    else
      set_error('Login to upvote.')
      redirect_to '/login'
    end
  end

  def upvote_params
    params.require(:upvote).permit(:user_id, :stance_id)
  end
end
