class UsersController < ApplicationController
  include AuthsHelper

  def quiz
    redirect_to :root unless logged_in?
    @user = current_user
  end

  def process_form
    user = current_user # should set up a filter
    redirect_to :root unless user
    fiscal, social = user.update_score(params["record_quiz"])

    @fiscal_score = fiscal
    @social_score = social
  end

  def index
    redirect_to :root unless current_admin
    @users = User.all
  end

  def new
    redirect_to action: :show, id: current_user.id if current_user
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    redirect_to :show if current_user
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to :quiz
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :middle_name, :username, :city, :state, :about, :email,  :password, :is_admin)
    end
end