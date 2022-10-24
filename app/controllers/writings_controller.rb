class WritingsController < ApplicationController
  def index
    @writings = Writing.all
  end
  
  def show
    @writing = Writing.find(params[:id])
  end

  def new 
    @writing = Writing.new
  end

  def create
    @writing = Writing.new(writing_params)
  
    if @writing.save
      redirect_to @writing
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @writing = Writing.find(params[:id])
  end

  def update
    @writing = Writing.find(params[:id])

    if @writing.update(writing_params)
      redirect_to @writing
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @writing = Writing.find(params[:id])
    @writing.destroy

    redirect_to root_path, status: :see_other
  end
  
  private
    def writing_params
      params.require(:writing).permit(:title, :logline, :w_file, :remove_w_file)
    end

end
