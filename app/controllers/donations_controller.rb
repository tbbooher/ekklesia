class DonationsController < ApplicationController
  include AuthsHelper

  def show
    @stance = Stance.find(params[:stance_id])
    @legislators = @stance.legislators
    @legislator_ids = @stance.legislators.map{|l|l.id}
  end

  def create
  end

  private
    def donation_params
      params.require(:donation).permit(:amount)
    end
end