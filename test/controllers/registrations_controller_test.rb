require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  
  test 'new method returns an empty user form' do
    get :new
    assert_response :success
    assert_not_nil assigns(:user) #assigns lets you get an instance variable
    assert_equal assigns(:user).is_a?(User)
    assert_template :new
  end

end