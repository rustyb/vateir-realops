class FlightBookingsController < ApplicationController
  def index
    #@flight_bookings = Flight.find(:all, :order => 'dtime')
    @search = Flight.search(params[:search])
    @flight_bookings = @search.all
  end
  
  def show
    @flight_booking = FlightBooking.find(params[:id])
  end

  def departures
    @search = Flight.search(params[:search])
    @flight_bookings = Flight.find(:all, :conditions => ["dep = 'EIDW'", true], :order => 'dtime ASC')
  end

  def arrivals
    @search = Flight.search(params[:search])
    @flight_bookings = Flight.find(:all, :conditions => ["arr = 'EIDW'", true], :order => 'atime ASC')
  end
 

  
end
