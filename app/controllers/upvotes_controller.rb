class UpvotesController < ApplicationController
  include AuthsHelper
  include ErrorsHelper
  def create

    existing_upvote = Upvote.find_by(upvote_params)
    
    upvote = Upvote.new(upvote_params)
    
    if existing_upvote
      redirect_to :back
    elsif upvote.save
      redirect_to stance_path(upvote.stance)
    elsif !logged_in?
      set_error('Login to upvote.')
      redirect_to '/login'
    end
  end

  def upvote_params
    params.require(:upvote).permit(:user_id, :stance_id)
  end
end
