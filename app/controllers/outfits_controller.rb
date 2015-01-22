class OutfitsController < ApplicationController
  before_action :authenticate_user!

  def index
    Outfit.duplicate_check
    @outfits = Outfit.order("created_at DESC").page(params[:page])
  end

  def new
    if [11,12,1,2,3,4].include?(Date.today.month)
      @outfit = Outfit.generate_random_cold
    else
      @outfit = Outfit.generate_random_hot
    end

  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user

    if !previewing? && @outfit.save
      flash[:notice] = "Your outfit was saved!"
      redirect_to outfits_path
    else
      render :new
    end
  end

  def show
    @outfit = current_user.outfits.find(params[:id])
  end

  def edit
    @outfit = current_user.outfits.find(params[:id])
  end

  def update
    @outfit = current_user.outfits.find(params[:id])
    @outfit.update(outfit_params)
    if previewing?
      render :edit
    else
      flash[:notice] = "Your outfit was updated"
      redirect_to outfit_path(@outfit)
    end
  end

  def destroy
    @outfit = current_user.outfits.find(params[:id])
    @outfit.destroy
    flash[:notice]= "Outfit deleted"
    redirect_to outfits_path
  end

  private

  def previewing?
    params[:preview_button].present?
  end

  def outfit_params
    params.require(:outfit).permit(:top_id, :bottom_id, :shoe_pair_id)
  end
end
