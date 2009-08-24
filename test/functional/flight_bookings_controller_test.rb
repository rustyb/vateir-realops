require 'test_helper'

class FlightBookingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => FlightBooking.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    FlightBooking.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    FlightBooking.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to flight_booking_url(assigns(:flight_booking))
  end
  
  def test_edit
    get :edit, :id => FlightBooking.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    FlightBooking.any_instance.stubs(:valid?).returns(false)
    put :update, :id => FlightBooking.first
    assert_template 'edit'
  end
  
  def test_update_valid
    FlightBooking.any_instance.stubs(:valid?).returns(true)
    put :update, :id => FlightBooking.first
    assert_redirected_to flight_booking_url(assigns(:flight_booking))
  end
  
  def test_destroy
    flight_booking = FlightBooking.first
    delete :destroy, :id => flight_booking
    assert_redirected_to flight_bookings_url
    assert !FlightBooking.exists?(flight_booking.id)
  end
end
