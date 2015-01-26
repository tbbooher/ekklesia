class DonationsController < ApplicationController
  include AuthsHelper

  def show
    @stance = Stance.find(params[:stance_id])
    @legislators = @stance.legislators
    @legislator_ids = @stance.legislators.map{|l|l.id}
  end

  def create
    token = params[:stripeToken]
    total = params[:donation]["amount"].to_i * 100
    @charge = Stripe::Charge.create(
      :amount => total,
      :currency => "usd",
      :card => token,
      :description => "something about your customer"
    )
  end

  private
    def donation_params
      params.require(:donation).permit(:amount)
    end
end