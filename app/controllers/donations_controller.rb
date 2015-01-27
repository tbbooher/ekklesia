class DonationsController < ApplicationController
  include AuthsHelper

  def show
    @stance = Stance.find(params[:stance_id])
    @legislators = @stance.legislators
    @legislator_ids = @stance.legislators.map{|l|l.id}
  end

  def create
    donation_amount = params[:donation]["amount"].to_i * 100
    legislator_ids = params[:donation]["legislator_ids"].map {|i| i.to_i}
    amounts = params[:donation]["amounts"].map {|i| i.to_i * 100}
    token = params[:stripeToken]
    user_id = current_user.id
    stance_id = params[:stance_id].to_i
    p amounts

    @charge = Stripe::Charge.create(
      :amount => donation_amount,
      :currency => "usd",
      :card => token,
      :description => "something about your customer"
    )

    i = 0
    legislator_ids.each do |l|
      p Donation.create(
        user_id: user_id,
        stance_id: stance_id,
        legislator_id: l,
        amount: amounts[i]
        )
      i += 1
    end
  end

  private
    def donation_params
      params.require(:donation).permit(:amount)
    end
end