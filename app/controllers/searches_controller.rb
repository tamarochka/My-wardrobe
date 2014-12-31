class SearchesController < ApplicationController

  def search
    @tops_search = Top.where(:name_like => params[:search])
  end

  def new

  end

end
