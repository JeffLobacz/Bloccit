class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    authorize @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_params)
    @comment.user = current_user
    @comment.post = @post
    # authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Error creating comment. Please try again."
      render :new
    end
  end

  private

  def post_params
    params.require(:comment).permit(:body)
  end

end