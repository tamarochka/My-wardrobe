class BottomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bottoms = current_user.bottoms.all.page(params[:page]) # limit to 20 or paginate
  end

  def new
    @bottom = Bottom.new
  end

  def create
    @bottom = Bottom.new(bottom_params)
    @bottom.user = current_user
    if @bottom.save
      flash[:notice] = "New bottom successfully added!"
      redirect_to bottoms_path
    else
       flash.now[:notice] = "There were problems processing your order!"
       render :new
    end
  end

  def show
    @bottom = current_user.bottoms.find(params[:id])
  end

  def edit
    @bottom = current_user.bottoms.find(params[:id])
  end

  def update
    @bottom = current_user.bottoms.find(params[:id])
    if @bottom.update(bottom_params)
      flash.now[:notice] = "Your item was updated"
      redirect_to bottom_path
    end
  end

  def destroy
    @bottom = current_user.bottoms.find(params[:id])
    @bottom.destroy
    redirect_to bottoms_path
  end

private

def bottom_params
    params.require(:bottom).permit(:bottom_type, :pic, :color)
  end
end
