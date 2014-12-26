class OutfitsController < ApplicationController

  def index
    @outfits = Outfit.all
  end

  def new
      @outfit = Outfit.new(top_id: generate_clean_top.id,bottom_id: generate_clean_bottom.id )
  end

  def create

  @outfit = Outfit.new(top_id: params["outfit"][:top_id],bottom_id: params["outfit"][:bottom_id])
    if @outfit.save
      #change worn outfit condition
      @outfit.top.update(:condition => "dirty")
      @outfit.bottom.update( :condition => "dirty")

      #update two week old outfit condition
      outfit_to_clean = Outfit.where("created_at = ?", 1.week.ago.utc)
      if outfit_to_clean.any?
        outfit_to_clean[0].top.update(:condition => "clean")
        outfit_to_clean[0].bottom.update(:condition => "clean")
      end
      flash[:notice] = "Your outfit was saved!"
    else
       flash.now[:notice] = "There were problems processing your order!"
    end

    redirect_to outfits_path
  end

  def show
    @outfit = Outfit.find(params[:id])
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

  def rand_top
    offset = rand(Top.count)
    rand_top = Top.offset(offset).first
  end

  def rand_bottom
    offset = rand(Bottom.count)
    rand_bottom = Bottom.offset(offset).first
  end

  def generate_clean_top
    top = rand_top
    while top.condition == "dirty" do
      top = rand_top
    end
    top
  end

  def generate_clean_bottom
    bottom = rand_bottom
    while bottom.condition == "dirty" do
      bottom = rand_bottom
    end
    bottom
  end

end
