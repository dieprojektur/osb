class TracksController < ApplicationController
  # GET /tracks
  # GET /tracks.xml
  def index
    @tracks = Track.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tracks }
    end
  end

  # GET /tracks/1
  # GET /tracks/1.xml
  def show
    @track = Track.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @track }
    end
  end

  # GET /tracks/new
  # GET /tracks/new.xml
  def new
    @open_space = current_user.open_spaces.get(params[:open_space_id])
    @track = @open_space.tracks.new

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @track }
    end
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.get(params[:id])
  end

  # POST /tracks
  # POST /tracks.xml
  def create

    @open_space = current_user.open_spaces.get(params[:open_space_id])
    @track = @open_space.tracks.new(params[:track])

    respond_to do |format|
      if @track.save
        format.html { redirect_to(@track, :notice => 'Track was successfully created.') }
        format.xml  { render :xml => @track, :status => :created, :location => @track }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @track.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tracks/1
  # PUT /tracks/1.xml
  def update
    @track = Track.get(params[:id])

    respond_to do |format|
      if @track.update(params[:track])
        format.html { redirect_to(@track, :notice => 'Track was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @track.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.xml
  def destroy
    @track = Track.get(params[:id])
    @track.destroy

    respond_to do |format|
      format.html { redirect_to(tracks_url) }
      format.xml  { head :ok }
    end
  end
end
