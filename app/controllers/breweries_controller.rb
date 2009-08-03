class BreweriesController < ApplicationController
  
  # setup find_brewery filter
  before_filter :find_brewery,
      :only => [:show, :edit, :update, :destroy]
    
  # GET /breweries
  # GET /breweries.xml
  def index
    @breweries = Brewery.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @breweries }
      format.json { render :json => @breweries }
    end
  end

  # GET /breweries/1
  # GET /breweries/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @brewery }
      format.json { render :json => @brewery }
    end
  end

  # GET /breweries/new
  # GET /breweries/new.xml
  def new
    @brewery = Brewery.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @brewery }
      format.json { render :json => @brewery }
    end
  end

  # GET /breweries/1/edit
  def edit
 
  end

  # POST /breweries
  # POST /breweries.xml
  def create
    @brewery = Brewery.new(params[:brewery])

    respond_to do |format|
      if @brewery.save
        flash[:notice] = 'Brewery was successfully created.'
        format.html { redirect_to(@brewery) }
        format.xml  { render :xml => @brewery, :status => :created, :location => @brewery }
        format.json { render :json => @brewery, :status => :created, :location => @brewery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @brewery.errors, :status => :unprocessable_entity }
        format.json { render :json => @brewery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /breweries/1
  # PUT /breweries/1.xml
  def update
    
    respond_to do |format|
      if @brewery.update_attributes(params[:brewery])
        flash[:notice] = 'Brewery was successfully updated.'
        format.html { redirect_to(@brewery) }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @brewery.errors, :status => :unprocessable_entity }
        format.json { render :json => @brewery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /breweries/1
  # DELETE /breweries/1.xml
  def destroy
    
    @brewery.destroy

    respond_to do |format|
      format.html { redirect_to(breweries_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
  
private
  def find_brewery
    @brewery = Brewery.find(params[:id])
    @beers = @brewery.beers
  end
end
