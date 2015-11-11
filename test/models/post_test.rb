require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #test "associations" do
   # user1 = users(:one)
   # user2 = users(:two)
   # post1 = posts(:boop)
   # post2 = posts(:beep)
  test "user associations are correct" do
   user = users(:one)
   assert user.posts.count > 0
 end
end
