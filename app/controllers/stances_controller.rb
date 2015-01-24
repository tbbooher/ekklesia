class StancesController < ApplicationController
  include AuthsHelper

  def index
    @stances = Stance.all.order('created_at DESC')
  end

  def new
    @issues = Issue.all
    @positions = Position.all
    @policitians = Politician.all
    @stance = Stance.new
  end

  def show
    @stance = Stance.find(params[:id])
    @position = Position.find(@stance.position_id)
    @author = User.find(@stance.user_id)
  end

  def create
    p params
      @stance = current_user.stances.new(stances_params)
      if @stance.save
        redirect_to stance_path(@stance)
      else
        flash[:alert] = "ERROR: #{@stances.errors.full_messages.join("; ")}"
        render :new
      end
    end

  private
    def stances_params
      params.require(:stance).permit(:position_id)
    end
end