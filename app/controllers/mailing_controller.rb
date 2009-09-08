class Admin::MailingsController < ApplicationController
  before_filter :login_required

  # Re-Send booking emails
	def create
		if Booking.resend_to_bookers(params[:limit].to_i)
			flash[:notice] = "Re-Sending Booking information"
			redirect_to root_path
		else
			flash[:error] = "There was a problem sending the invitations."
			redirect_to root_path
		end
	end
end
