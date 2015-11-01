class User < ActiveRecord::Base
has_many :posts
has_many :comments

  validates_presence_of :username, :email, :password
  validates_length_of :password, minimum: 6
  validates_uniqueness_of :username, :email
end
