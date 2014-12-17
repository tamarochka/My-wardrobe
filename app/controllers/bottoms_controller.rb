class BottomsController < ApplicationController

  def index
    @bottoms = Bottom.all
  end

  def new
    @bottom = Bottom.new
  end

  def create
    @bottom = Bottom.new(bottom_type: params["bottom"][:bottom_type], pic: params["bottom"][:pic])
    if @bottom.save
      flash[:notice] = "Your item was submitted!"
      render :index
    else
       flash.now[:notice] = "There were problems processing your order!"
    end
  end

  def show
    @bottom = Bottom.find(params[:id])
  end

end
