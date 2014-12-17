class TopsController < ApplicationController

  def index
    @tops = Top.all
  end

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(top_params)
    if @top.save
      flash[:notice] = "Your item was submitted!"
    else
       flash.now[:notice] = "There were problems processing your order!"
    end
    redirect_to tops_path
  end

  def show
    @top = Top.find(params[:id])
  end

  def edit
    @top = Top.find(params[:id])
  end

  def update
    @top = Top.find(params[:id])
    if @top.update(top_params)
      flash.now[:notice] = "Your item was updated"
    end
    redirect_to top_path
  end

  def destroy
    @top = Top.find(params[:id])
    @top.destroy
    redirect_to tops_path
  end


  private

  def top_params
    params.require(:top).permit(:top_type, :pic, :color)
  end

end
