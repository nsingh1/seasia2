class ProjectsController < ApplicationController
before_filter :signed_in_user, :only=> [:index, :create, :destroy, :new, :edit, :show, :discuss]
before_filter :correct_user,   :only=> :destroy

@invites=Invite.all


	def show
		@user = User.all
		@project = Project.find_by_project_name(params[:id])

                  @owner=User.find_by_id(@project.user_id)
		if @project
		@invites = Invite.all
		@invites = @project.invites(:page => params[:page])
		
		@microposts = Micropost.all
		@microposts = @project.microposts(:page => params[:page])
                
		@floads = Fload.all
		@floads = @project.floads(:page => params[:page])
		@micropost=Micropost.new
		@comment=Comment.new
		else
		(render :file => "#{Rails.root}/public/422.html", :status => 422, :layout => false)
		end		
		
             
	end
#-------------------	
	def new
		 @project=Project.new
                 
  	end
#-------------------	
	def edit
		 @project=Project.find_by_project_name(params[:id])
	end
#-------------------	
	def discuss
		 @project=Project.find_by_project_name(params[:id])
	end
#-------------------	
	def index
		@invites=Invite.all		 
		@projects=Project.all
               @user=User.all
	end
#-------------------	
	def create
                @project = current_user.projects.build(params[:project])
		@owner=current_user.name		    
                @invites=Invite.all
		    if @project.save
			      
			      redirect_to projects_path,:flash =>   {:notice => "Project created"} 
		    else
			     render 'new'
		    end
	end
#-------------------	
def del
@project = Project.find_by_project_name(params[:id])
end	
def destroy
		@project = Project.find_by_project_name(params[:id])
           
		if @project.destroy
                
		redirect_to projects_path,:flash =>   {:notice => "project deleted "}
                else
                render 'edit'
                end 
	end
#-------------------	
	def update
		 @project=Project.find_by_project_name(params[:id])
                 @invites=Invite.all
		  if @project.update_attributes(params[:project])
		      
		      redirect_to project_path(@project),:flash =>   {:error => "Project Updated. "} 
		else
		      render 'static_pages/home'
	       end
       end
#-------------------	
  private

	def correct_user
      		@project = current_user.projects.find_by_project_name(params[:id])
	        redirect_to project_path if @project.nil?
	end
end
