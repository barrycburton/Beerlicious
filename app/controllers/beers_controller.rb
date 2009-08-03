class BeersController < ApplicationController
  
  # setup find_beer filter
  before_filter :find_beer,
      :only => [:show, :edit, :update, :destroy]
      
  # GET /beers
  # GET /beers.xml
  def index
    @beers = Beer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @beers }
      format.json { render :json => @beers }
    end
  end

  # GET /beers/1
  # GET /beers/1.xml
  def show
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @beer }
      format.json { render :json => @beer }
    end
  end

  # GET /beers/new
  # GET /beers/new.xml
  def new
    @beer = Beer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @beer }
      format.json { render :json => @beer }
    end
  end

  # GET /beers/1/edit
  def edit

  end

  # POST /beers
  # POST /beers.xml
  def create
    @beer = Beer.new(params[:beer])

    respond_to do |format|
      if @beer.save
        flash[:notice] = 'Beer was successfully created.'
        format.html { redirect_to(@beer) }
        format.xml  { render :xml => @beer, :status => :created, :location => @beer }
        format.json { render :json => @beer, :status => :created, :location => @beer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @beer.errors, :status => :unprocessable_entity }
        format.json { render :json => @beer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /beers/1
  # PUT /beers/1.xml
  def update

    respond_to do |format|
      if @beer.update_attributes(params[:beer])
        flash[:notice] = 'Beer was successfully updated.'
        format.html { redirect_to(@beer) }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @beer.errors, :status => :unprocessable_entity }
        format.json { render :json => @beer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.xml
  def destroy

    @beer.destroy

    respond_to do |format|
      format.html { redirect_to(beers_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
  
private
  def find_beer
    @beer = Beer.find(params[:id])
    @containers = @beer.containers
  end
end
