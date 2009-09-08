# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  unloadable
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :free_flights
  include AuthenticatedSystem
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def free_flights
    @booked = Flight.count(:conditions => "flights.id = bookings.flight_id", :include => :booking)
    @not_booked = Flight.count
    @free_flights = (@not_booked - @booked)
  end
  
  
  def admin_logged_in?
    logged_in?
  end

end
