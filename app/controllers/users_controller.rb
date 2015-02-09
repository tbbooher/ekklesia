class UsersController < ApplicationController
  include AuthsHelper

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
      redirect_to :root
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :middle_name, :username, :city, :state, :about, :email,  :password, :is_admin)
    end
end