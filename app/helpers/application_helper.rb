module ApplicationHelper
  def my_name
    p "Jeff J. Lobacz"
  end

  def result
    Post.create(title: "First Post", body: "This is the first post in our system")
    post = Post.first
    post
  end

end
