class StoresController < ApplicationController

  # setup find_store filter
  before_filter :find_store,
      :only => [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.xml
  def index
    @stores = Store.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stores }
      format.json { render :json => @stores }
    end
  end

  # GET /stores/1
  # GET /stores/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @store }
      format.json { render :json => @store }
    end
  end

  # GET /stores/new
  # GET /stores/new.xml
  def new
    @store = Store.new
    @kinds = [ ['Restaurant', 'Restaurant'], ['Bar', 'Bar'], ['Grocery Store', 'GroceryStore'], ['Convenience Store', 'ConvenienceStore'] ]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @store }
      format.json { render :json => @store }
    end
  end

  # GET /stores/1/edit
  def edit

    @kinds = { "Restaurant" => "Restaurant", "Bar" => "Bar", "Grocery Store" => "GroceryStore", "Convenience Store" => "ConvenienceStore" }
        
  end

  # POST /stores
  # POST /stores.xml
  def create
    @store = Store.new(params[:store])

    respond_to do |format|
      if @store.save
        flash[:notice] = 'Store was successfully created.'
        format.html { redirect_to(@store) }
        format.xml  { render :xml => @store, :status => :created, :location => @store }
        format.json { render :json => @store, :status => :created, :location => @store }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
        format.json { render :json => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stores/1
  # PUT /stores/1.xml
  def update

    respond_to do |format|
      if @store.update_attributes(params[:store])
        flash[:notice] = 'Store was successfully updated.'
        format.html { redirect_to(@store) }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
        format.json { render :json => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.xml
  def destroy

    @store.destroy

    respond_to do |format|
      format.html { redirect_to(stores_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end

private
  def find_store
    @store = Store.find(params[:id])
    @beers = @store.beers
  end

end
