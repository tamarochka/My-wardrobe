class SearchesController < ApplicationController

  def search
    @tops_search = Top.search(:name_like => params[:search])
  end

end
