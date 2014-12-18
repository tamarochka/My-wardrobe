class OutfitsController < ApplicationController

  def index
    @outfits = Outfit.all
  end

  def new
    offset = rand(Top.count)
    rand_top = Top.offset(offset).first
    offset = rand(Bottom.count)
    rand_bottom = Bottom.offset(offset).first
    @outfit = Outfit.new(top_id: rand_top.id,bottom_id: rand_bottom.id )

  end

  def create

  @outfit = Outfit.new(top_id: params["outfit"][:top_id],bottom_id: params["outfit"][:bottom_id])
    if @outfit.save
      flash[:notice] = "Your item was submitted!"
    else
       flash.now[:notice] = "There were problems processing your order!"
    end
    redirect_to outfits_path
  end

  def show
    @outfit = Outfit.new(top_id: rand(Top.count),bottom_id: rand(Bottom.count) )
  end

  def edit
    @outfit = Outfit.find(params[:id])
  end

  def update
    @top = Top.find(params[:id])
    if @top.update(top_params)
      flash.now[:notice] = "Your item was updated"
    end
    redirect_to top_path
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to outfits_path
  end


  private

  def top_params
    params.require(:top).permit(:top_type, :pic, :color)
  end

end
