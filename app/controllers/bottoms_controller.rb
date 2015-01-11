class BottomsController < ApplicationController

  def index
    @bottoms = current_user.bottoms.all # limit to 20 or paginate 
  end

  def new
    @bottom = Bottom.new
  end

  def create
    @bottom = Bottom.new(bottom_params)
    if @bottom.save
      flash[:notice] = "Your item was submitted!"
    else
       flash.now[:notice] = "There were problems processing your order!"
    end
    redirect_to bottoms_path
  end

  def show
    @bottom = Bottom.find(params[:id])
  end

  def edit
    @bottom = Bottom.find(params[:id])
  end

  def update
    @bottom = Bottom.find(params[:id])
    if @bottom.update(bottom_params)
      flash.now[:notice] = "Your item was updated"
      redirect_to bottom_path
    end
  end

  def destroy
    @bottom = Bottom.find(params[:id])
    @bottom.destroy
    redirect_to bottoms_path
  end

private

def bottom_params
    params.require(:bottom).permit(:bottom_type, :pic, :color, :user_id)
  end
end
