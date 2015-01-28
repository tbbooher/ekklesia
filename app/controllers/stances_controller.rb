class StancesController < ApplicationController
  include AuthsHelper

  def index
    @stances = Stance.all.order("created_at DESC")[0..20]
    @issues = Issue.all
  end

  def new
    @issues = Issue.all
    @legislators = Legislator.all
    @stance = Stance.new
  end

  def show
    @stance = Stance.find(params[:id])
    @position = Position.find(@stance.position_id)
    @author = User.find(@stance.user_id)
    @upvote = Upvote.new
  end

  def create
    position_id = params[:position_id].select{ |k,v| v == "true" }.keys.map(&:to_i)[0]
    @stance = current_user.stances.new(position_id: position_id)
    if @stance.save
      redirect_to stance_path(@stance)
    else
      flash[:alert] = "ERROR: #{@stances.errors.full_messages.join("; ")}"
      render :new
    end
    if params[:legislator_id]
      legislator_ids = params[:legislator_id].select{ |k,v| v == "true" }.keys.map(&:to_i)
      legislator_ids.each { |l_id| @stance.legislator_stances.create(legislator_id: l_id) }
    end
  end

  def destroy
    @stance = Stance.find(params[:id]).destroy
    redirect_to :stances
  end

  def search
    @issues = Issue.fetch(5)
    @stances = Stance.search(params[:search][:words]) || Stance.search(params[:search][:words])
  end

  def select
    @issues = Issue.all
    @stances = Stance.search(params[:select])[0..30]

    if request.xhr?
      render :_search_results, layout: false, collection: @stances
    else
      render :index
    end
  end

  def positions_by_issue
    @positions = Position.where(issue_id: params[:issue_id])
    render partial: "/stances/position_check_list", locals: {positions: @positions}
  end


  private
    def stances_params
      params.require(:stance).permit(:position_id, :legislator_id)
    end
end