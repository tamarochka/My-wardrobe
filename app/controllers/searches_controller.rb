class SearchesController < ApplicationController

  def index
    keywords = params[:keywords]
    @tops = Top.where("color ILIKE ? OR top_type ilike ?", "%#{keywords}%", "%#{keywords}%")
    @bottoms = Bottom.where("color ILIKE ? OR bottom_type ilike ?", "%#{keywords}%", "%#{keywords}%")
    @tems = @tops + @bottoms

    render :index
  end

end
