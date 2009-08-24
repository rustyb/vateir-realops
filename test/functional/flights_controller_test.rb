require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Flight.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Flight.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Flight.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to flight_url(assigns(:flight))
  end
  
  def test_edit
    get :edit, :id => Flight.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Flight.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Flight.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Flight.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Flight.first
    assert_redirected_to flight_url(assigns(:flight))
  end
  
  def test_destroy
    flight = Flight.first
    delete :destroy, :id => flight
    assert_redirected_to flights_url
    assert !Flight.exists?(flight.id)
  end
end
