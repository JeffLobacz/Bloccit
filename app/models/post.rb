class Post < ActiveRecord::Base
  has_many :comments

  def result2
    Post.create(title: "First Post")
    post2 = Post.first
    post2
  end
end
