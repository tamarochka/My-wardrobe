class ClothingsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:keywords]
      @clothings = current_user.clothings.search(params[:keywords])
    else
      @clothings = current_user.clothings
    end

    @clothings = @clothings.page(params[:page])
  end

  def new
    @clothing = Clothing.new
  end

  def create
    @clothing = Clothing.new(clothing_params)
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
    @clothing = current_user.clothings.find(params[:id])
  end

  def edit
    @clothing = current_user.clothings.find(params[:id])
    # binding.pry
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
    @clothing.destroy
    redirect_to clothings_path
  end

  private

  def clothing_params
    params.require(:clothing).permit(:clothing_type, :clothing_style, :image, :color, :weather)
  end

end