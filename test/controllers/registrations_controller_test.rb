require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  
  test 'new method returns an empty user form' do
    get :new
    assert_response :success
    assert_not_nil assigns(:user) #assigns lets you get an instance variable
    assert_equal assigns(:user).is_a?(User)
    assert_template :new
  end

  test 'cannot duplicate email' do
    user1 = users(:one)
    user2 = User.new(username: "kittykitty", email: "danimal@test.up", password_digest: "meeowmeow")
    refute user2.save
    assert user.errors[:email].duplicate?
end