# class DonationsController < ApplicationController
#   include AuthsHelper

#   def show
#     if request.xhr?
#       render partial: "/donations/table", locals: {donations: current_user.donations}
#     else
#       @donations = current_user.donations
#     end
#   end

#   def create
#     redirect_to :root
#   end

#   def email
#     current_user.update(donation_email: true)
#     render partial: "/donations/email" if request.xhr?
#   end

#   def new
#     redirect_to :login unless logged_in?
#     @stance = Stance.find(params[:stance_id])
#     @legislators = @stance.legislators
#     @legislator_ids = @stance.legislators.map{|l|l.id}
#   end

#   private
#     def donation_params
#       params.require(:donation).permit(:amount)
#     end
# end
