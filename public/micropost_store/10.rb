class InvitesController < ApplicationController
  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @invites }
    end
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
    @invite = Invite.find_by_name(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @invite }
    end
  end

  # GET /invites/new
  # GET /invites/new.json
  def new
    @invite = Invite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @invite }
    end
  end

  # GET /invites/1/edit
  def edit
    @invite = Invite.find_by_name(params[:id])
  end

  # POST /invites
  # POST /invites.json
def create
    @project = Project.find_by_project_name(params[:project_id])
    @invite = Invite.new(params[:invite])
    @invite.project = @project
    @invite.user = current_user  
@user=current_user.name

      if @invite.save
        UserMailer.registration_confirmation(@invite,@user,@project.project_name).deliver  #include this line in your users_controller.rb file
	redirect_to @project,:notice => 'The person was successfully included in your project .' 
      else
	redirect_to @project,:notice => 'The person was already included in this project.' 

        end
    end


  # PUT /invites/1
  # PUT /invites/1.json
  def update
    @invite = Invite.find_by_name(params[:id])

    respond_to do |format|
      if @invite.update_attributes(params[:invite])
        format.html { redirect_to @invite, :notice => 'Invite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @invite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json


  def destroy
   @invite=Invite.find_by_id(params[:id])
	if @invite.destroy
		@p=@invite.project
		if @p.user_id == current_user.id
			flash.now[:success] = "#{@p.user_id}" 
			redirect_to project_path(@p)
		else 
			flash.now[:success] = "#{@p.user_id}"  
			redirect_to :action => "index", :controller => "projects"
		end
	 else
                render 'edit'
         end 
      
    
  end

end
