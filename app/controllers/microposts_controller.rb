class MicropostsController < ApplicationController

 def create

    @project = Project.find_by_project_name(params[:project_id])
    @micropost = @project.microposts.build(params[:micropost])
    #@micropost = Micropost.new(params[:micropost])
    @micropost.project = @project
    @micropost.user = current_user 
    @invites = Invite.all
    @invites = @project.invites(:page => params[:page])
    
    respond_to do |format|
#----------------------------------------------
    @user = current_user
    @prg = Project.all

	@prg.each do|p|
		if(p.id == @micropost.project_id)
			@pname=p.project_name  
			@cname=p.company_name
			@uid=p.user_id 
		end
	end
#------------------------------------------------

@project.invites.each do |friend| 
@a=User.find_by_id(current_user.id)
   if @a.email ==  friend.mail 
    @valid_user = friend
   end
end
if  @valid_user || current_user.id == @project.user_id
     if @micropost.save

	#-----------------------------------------------
	@invite=Invite.all
	@userd=User.all	
	@invite.each do |i|
		if(i.project_id == @micropost.project_id && i.mail != @user.email)
			@userd.each do |u|	
			if(i.mail == u.email )
					@imail=i.mail
					UserMailer.micropost_confirmation(@micropost,@imail,@pname,@cname).deliver
				end
		end
		end
	end
	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@userd.each do |u|
		if(@uid == u.id && u.email != @user.email)

			@imail=u.email	
			UserMailer.micropost_confirmation(@micropost,@imail,@pname,@cname).deliver
	end
	end
	#----------------------------------------------------

        format.html {redirect_to project_path(@project)}
	format.js  
      else
	format.html {redirect_to project_path(@project),:flash =>   {:error => "Discussion Text field could not be empty, Discussion not created "}}
    end
  else
	format.html {redirect_to project_path(@project), :flash =>   {:error => "you are removed from this project."}}
  end
 end
end
def destroy
    @micropost = Micropost.find(params[:id])
    @pid=@micropost.project_id
    @project=Project.find_by_id(@pid) 
      respond_to do |format|       
       if @micropost.destroy
	 format.html{redirect_to project_path(@project)}
	   format.js
       else
         format.html{redirect_to project_path(@project), :error => 'micropost not deleted!'}
       end
     end 

end 
end
