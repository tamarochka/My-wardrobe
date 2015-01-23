class OutfitsController < ApplicationController
  before_action :authenticate_user!, except: [:display_public, :show]

  def index
    @outfits = current_user.outfits.order("created_at DESC").page(params[:page])
  end

  def new
    if [11,12,1,2,3,4].include?(Date.today.month)
      @outfit = Outfit.generate_random_cold(current_user)
    else
      @outfit = Outfit.generate_random_hot(current_user)
    end

  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.user = current_user

    if !previewing? && @outfit.save
      flash[:notice] = "Your outfit was saved!"
      redirect_to outfits_path
      Outfit.duplicate_check
    else
      render :new
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
    if !@outfit.shared?
      authanticate!
    end
  end

  def edit
    @outfit = current_user.outfits.find(params[:id])
  end

  def update
    @outfit = current_user.outfits.find(params[:id])
    if params["commit"] == "Make public"
      @outfit.update(:shared => "yes")
      redirect_to display_public_path
    else
      @outfit.update(outfit_params)
      if previewing?
        render :edit
      else
        flash[:notice] = "Your outfit was updated"
        redirect_to outfit_path(@outfit)
      end
    end
  end

  def destroy
    @outfit = current_user.outfits.find(params[:id])
    @outfit.destroy
    flash[:notice]= "Outfit deleted"
    redirect_to outfits_path
  end

  def display_public
    @outfits = Outfit.where(shared: "yes").page(params[:page])
  end


  private

  def previewing?
    params[:preview_button].present?
  end

  def outfit_params
    params.require(:outfit).permit(:top_id, :bottom_id, :shoe_pair_id)
  end
end
