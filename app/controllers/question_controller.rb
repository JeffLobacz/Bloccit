class QuestionController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new(params.require(:advertisement).permit(:title, :body))
    if @advertisement.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisement
    else
      flash[:error] = "There was an error saving the advertisement. Please try again."
      render :new
    end
  end

  def edit
    @advertisement = Advertisement.find(params[:id])
  end

  def update
    @advertisement = Advertisement.find(params[:id])
    if @advertisement.update_attributes(params.require(:advertisement).permit(:title, :body))
      flash[:notice] = "Advertisement was updated."
      redirect_to @advertisement
    else
      flash[:error] = "There was an error saving the advertisement. Please try again."
      render :edit
    end
  end
end
end
