class DonationsController < ApplicationController
  include AuthsHelper

  def show
    @stance = Stance.find(params[:stance_id])
    @legislators = @stance.legislators
    @legislator_ids = @stance.legislators.map{|l|l.id}
  end

  def create
    amount = params[:donation]["amount"].to_i * 100
    token = params[:stripeToken]

    @charge = Stripe::Charge.create(
      :amount => amount,
      :currency => "usd",
      :card => token,
      :description => "something about your customer"
    )

    Donation.create_records(params)
  end

  private
    def donation_params
      params.require(:donation).permit(:amount)
    end
end
