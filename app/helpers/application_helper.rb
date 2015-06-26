module ApplicationHelper
  def my_name
    p "Jeff J. Lobacz"
  end

  def result
    Post.create(title: "First Post")
    post = Post.first
    post
  end

end
