class FloadsController < ApplicationController
  # GET /floads
  # GET /floads.json
  def index
    @floads = Fload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @floads }
    end
  end

  # GET /floads/1
  # GET /floads/1.json
  def show
    @fload = Fload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fload }
    end
  end

  # GET /floads/new
  # GET /floads/new.json
  def new
    @fload = Fload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @fload }
    end
  end

  # GET /floads/1/edit
  def edit
    @fload = Fload.find(params[:id])
  end

  # POST /floads
  # POST /floads.json
  def create
	 @project = Project.find_by_project_name(params[:project_id])
	@micropost = Micropost.new(params[:micropost])    
	@fload = @micropost.floads.build(params[:fload])
        @fload.project_id = @micropost.project_id
	@fload.micropost = @micropost
    @fload.user = current_user
@project.invites.each do |friend| 
@a=User.find_by_id(current_user.id)
   if @a.email ==  friend.mail 
    @valid_user = friend
   end
end
if  @valid_user || current_user.id == @project.user_id	

    if @fload.save
       redirect_to micropost_path(@project),:flash =>   {:notice => "file uploaded"}
    else
       redirect_to micropost_path(@project)
    end
   else
redirect_to projects_path,:flash =>   {:error => "you are removed from this project."}
end 
  end

  # PUT /floads/1
  # PUT /floads/1.json
  def update
    @fload = Fload.find(params[:id])

    respond_to do |format|
      if @fload.update_attributes(params[:fload])
        format.html { redirect_to @fload, :flash =>   {:notice => "Fload was successfully updated." }}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @fload.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /floads/1
  # DELETE /floads/1.json
  def destroy
    @fload = Fload.find(params[:id])
    @fload.destroy

    respond_to do |format|
      format.html { redirect_to floads_url }
      format.json { head :no_content }
    end
  end
end
