class Post < ActiveRecord::Base
  has_many :comments

  def result
    Post.create(title: "First Post")
    post = Post.first
    post
  end
end
