class PostsController < ApplicationController
  # The following 5 lines satisfies the first two bullet points in the assignment:
  # "Add a before_action filter, called flash_attack, that sets a flash before every
  # action in PostsController"

  # before_action :flash_attack

  # def flash_attack
  #   flash[:notice] = "Assignment Post-Related Views Only Flash Attack!"
  # end

  # The following 7 lines is the beginning of an attempt to satsify the last part of the assignment --
  # and is incomplete.  I am not sure how to go about using a "skip_before_action".

  # skip_before_action :no_flash_attack
 
  # def no_flash_attack
  #   flash[:notice] = "This is not a Flash Attack!"
  # end

  # skip_before_action :flash_attack, only: [:new, :index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end
