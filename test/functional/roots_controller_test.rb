require 'test_helper'

class RootsControllerTest < ActionController::TestCase
  def test_edit
    get :edit, :id => Root.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Root.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Root.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Root.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Root.first
    assert_redirected_to root_url
  end
  
  def test_destroy
    root = Root.first
    delete :destroy, :id => root
    assert_redirected_to root_url
    assert !Root.exists?(root.id)
  end
end
