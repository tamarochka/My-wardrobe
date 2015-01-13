class TopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tops = current_user.tops.page(params[:page])
  end

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(top_params)
    @top.user = current_user

    if @top.save
      flash[:notice] = "New top successfully added!"
      redirect_to tops_path
    else
       flash.now[:notice] = "There were problems processing your order!"
       render :new
    end
  end

  def show
    @top = current_user.tops.find(params[:id])
  end

  def edit
    @top = current_user.tops.find(params[:id])
  end

  def update
    @top = current_user.tops.find(params[:id])
    if @top.update(top_params)
      flash.now[:notice] = "Your item was updated"
    end
    redirect_to top_path
  end

  def destroy
    @top = current_user.tops.find(params[:id])
    # @top = Top.where(id: params[:id], user: current_user).first
    @top.destroy
    redirect_to tops_path
  end

  private

  def top_params
    params.require(:top).permit(:top_type, :pic, :color)
  end
end
