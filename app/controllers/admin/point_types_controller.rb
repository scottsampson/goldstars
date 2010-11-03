class Admin::PointTypesController < Admin::ApplicationController
  # GET /point_types
  # GET /point_types.xml
  def index
    @point_types = PointType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @point_types }
    end
  end

  # GET /point_types/1
  # GET /point_types/1.xml
  def show
    @point_type = PointType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @point_type }
    end
  end

  # GET /point_types/new
  # GET /point_types/new.xml
  def new
    @point_type = PointType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @point_type }
    end
  end

  # GET /point_types/1/edit
  def edit
    @point_type = PointType.find(params[:id])
  end

  # POST /point_types
  # POST /point_types.xml
  def create
    @point_type = PointType.new(params[:point_type])

    respond_to do |format|
      if @point_type.save
        format.html { redirect_to(admin_point_types_path, :notice => 'Point type was successfully created.') }
        format.xml  { render :xml => @point_type, :status => :created, :location => @point_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @point_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /point_types/1
  # PUT /point_types/1.xml
  def update
    @point_type = PointType.find(params[:id])

    respond_to do |format|
      if @point_type.update_attributes(params[:point_type])
        format.html { redirect_to([:admin,@point_type], :notice => 'Point type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @point_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /point_types/1
  # DELETE /point_types/1.xml
  def destroy
    @point_type = PointType.find(params[:id])
    @point_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_point_types_url) }
      format.xml  { head :ok }
    end
  end
end
