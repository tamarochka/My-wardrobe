class SearchesController < ApplicationController

  def index
    keywords = params[:keywords]
    @tops = Top.where("color LIKE ? OR top_type like ?", "%#{keywords}%", "%#{keywords}%")
    @bottoms = Bottom.where("color LIKE ? OR bottom_type like ?", "%#{keywords}%", "%#{keywords}%")
    render :index
  end

end
