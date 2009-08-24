class FlightsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @flights = Flight.find(:all, :include => :booking)
    
  end
  
  def show
    @flight = Flight.find(params[:id])
    @booking = Booking.find_by_flight_id(params[:id])
  end
  
  def new
    @flight = Flight.new
  end
  
  def create
    @flight = Flight.new(params[:flight])
    if @flight.save
      flash[:notice] = "Successfully created flight."
      redirect_to @flight
    else
      render :action => 'new'
    end
  end
  
  def edit
    @flight = Flight.find(params[:id])
  end
  
  def update
    @flight = Flight.find(params[:id])
    if @flight.update_attributes(params[:flight])
      flash[:notice] = "Successfully updated flight."
      redirect_to @flight
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy
    flash[:notice] = "Successfully destroyed flight."
    redirect_to flights_url
  end
end
