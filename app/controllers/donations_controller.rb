class DonationsController < ApplicationController
  include AuthsHelper

  def show
    if request.xhr?
      render partial: "/donations/table", locals: {donations: current_user.donations}
    else
      @donations = current_user.donations
    end
  end

  def create
    redirect_to :root
  end

  def new
    redirect_to :root
  end

  private
    def donation_params
      params.require(:donation).permit(:amount)
    end
end
