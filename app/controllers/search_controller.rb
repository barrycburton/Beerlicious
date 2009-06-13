class SearchController < ApplicationController
  def index
    @beers = Beer.find_by_contents( params[:q] )
  end
end
