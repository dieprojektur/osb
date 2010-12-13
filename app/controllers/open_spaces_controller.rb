class OpenSpacesController < ApplicationController
  before_filter :authenticate_user!
  layout false
  # GET /open_spaces
  # GET /open_spaces.xml
  def index
    startdate = Time.at(params[:start].to_i)
    enddate = Time.at(params[:end].to_i)
    @open_spaces = current_user.open_spaces.all(:start.gte => startdate, :end.lte => enddate)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @open_spaces }
      format.json { render :json => @open_spaces }
    end
  end

  # GET /open_spaces/1
  # GET /open_spaces/1.xml
  def show
    @open_space = OpenSpace.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @open_space }
    end
  end

  # GET /open_spaces/new
  # GET /open_spaces/new.xml
  def new
    @open_space = OpenSpace.new

    respond_to do |format|
      format.html { render :layout => false }# new.html.erb
      format.xml  { render :xml => @open_space }
    end
  end

  # GET /open_spaces/1/edit
  def edit
    @open_space = OpenSpace.get(params[:id])
  end

  # POST /open_spaces
  # POST /open_spaces.xml
  def create
    @open_space = current_user.open_spaces.new(params[:open_space])

    respond_to do |format|
      if @open_space.save
        format.html { redirect_to(@open_space, :notice => 'Open space was successfully created.') }
        format.xml  { render :xml => @open_space, :status => :created, :location => @open_space }
        format.js   
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @open_space.errors, :status => :unprocessable_entity }
        format.js   { render :json => @open_space.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /open_spaces/1
  # PUT /open_spaces/1.xml
  def update
    @open_space = OpenSpace.get(params[:id])

    respond_to do |format|
      if @open_space.update(params[:open_space])
        format.html { redirect_to(@open_space, :notice => 'Open space was successfully updated.') }
        format.xml  { head :ok }
        format.js   
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @open_space.errors, :status => :unprocessable_entity }
        format.js   { render :json => @open_space.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /open_spaces/1
  # DELETE /open_spaces/1.xml
  def destroy
    @open_space = OpenSpace.get(params[:id])
    @open_space.destroy

    respond_to do |format|
      format.html { redirect_to(open_spaces_url) }
      format.xml  { head :ok }
    end
  end
end
