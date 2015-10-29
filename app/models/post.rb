class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates_presence_of :title, :link
  validates_uniqueness_of :link
end
