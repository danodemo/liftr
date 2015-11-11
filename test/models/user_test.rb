require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #test "user successfully added to db" do
  #  assert true
  #end
  test "emails must be present" do #This tests that a blank field will not trigger a .save
    user = User.new #this should create an empty model
    refute user.save #this says "prove that user doesn't save when blank"
    assert user.errors[:email].present? #"Check that it's because e-mail is blank"
  end

  test "users successfully save when fields are present" do
    user = User.new(username: "kittykitty", email: "catbox@litter.com", password_digest: "meeowmeow")
    assert user.save
    assert user.errors.empty?
  end

end
