class UsersController < ApplicationController
#before_action :authenticate_user!

def index
  @users = User.all
  render :userindex
end

def myposts
@post = Post.find(user_id: current_user.id)
render :myposts
end


def mycomments
@comment = Comment.find_by(user_id: current_user.id)
render :mycomments
end

#def welcome
 #render :welcome
#end1

end
