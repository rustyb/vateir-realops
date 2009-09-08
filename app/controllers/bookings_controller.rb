class BookingsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  def index
    @bookings = Booking.find(:all, :include => :flight)
    
  end
  
  def show
    @booking = Booking.find(params[:id], :include => :flight)

  end
  
  def new
    @booking = Booking.new(:include => :flight)
    #@book_flight = Flight.find_by_callsign(params[:callsign])
  end
  
  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      #BookingMailer.deliver_new_booking(@booking)
      flash[:success] = "Thanks a million #{@booking.name},for your booking for flight <b>#{@booking.flight.callsign}</b> from <b>#{@booking.flight.dep}</b> to <b>#{@booking.flight.arr}</b> is confirmed"
      flash[:notice] = "An email, containging all the information realated to your flight, is now speeding its way to the email address you supplied.<br /><br /> Remember to check your spam box, the email could end up there by accident."
      redirect_to flight_bookings_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @booking = Booking.find(params[:id])
  end
  
  def update
    @booking = Booking.find(params[:id])
    if @booking.update_attributes(params[:booking])
      flash[:notice] = "Successfully updated booking."
      redirect_to @booking
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Successfully destroyed booking."
    redirect_to bookings_url
  end
end
