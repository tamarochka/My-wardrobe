class ClothingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clothings = current_user.clothings.all.page(params[:page]) # limit to 20 or paginate
  end

  def new
    @clothing = Clothing.new #Bottom.new
  end

  def create
    @clothing = Clothing.new(clothing_params)
    # @clothing.type = "bottom"
    @clothing.user = current_user
    if @clothing.save
      flash[:notice] = "New clothing was successfully added!"
      redirect_to clothings_path
    else
       flash.now[:notice] = "There were problems processing your order!"
       render :new
    end
  end

  def show
    # @bottom = current_user.bottoms.find(params[:id])
  end

  def edit
    @clothing = current_user.clothings.find(params[:id])
  end

  def update
    @clothing = current_user.clothings.find(params[:id])
    if @clothing.update(clothing_params)
      flash.now[:notice] = "Your item was updated"
      redirect_to clothing_path(@clothing)
    else
      flash.now[:notice] = "There were some problems"
      render :edit
    end
  end

  def destroy
    @clothing = current_user.clothings.find(params[:id])
    @bclothing.destroy
    redirect_to clothings_path
  end

  private

  def clothing_params
    params.require(:clothing).permit(:clothing_type, :clothing_style, :image, :color, :weather)
  end

end
