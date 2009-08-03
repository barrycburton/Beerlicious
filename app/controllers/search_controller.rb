class SearchController < ApplicationController
  def index
    @beers = Beer.find_by_contents( params[:q] )
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @beers }
      format.json { render :json => @beers }
    end
    
  end
end
