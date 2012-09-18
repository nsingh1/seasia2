class CommentsController < ApplicationController
def new
    @comment = Comment.new
    @p = @micropost.project_id
    @project = Project.find_by_id(@p)

    respond_to do |format|
      format.html {redirect_to @project}
	format.js
    end
end
#==========================================================
def create
	
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.build(params[:comment])
    @comment.project_id = @micropost.project_id
    @p = @micropost.project_id
    @project = Project.find_by_id(@p)
    @comment.micropost = @micropost
    @comment.user = current_user

    respond_to do |format|
    #----------------------------------------------
    @user = current_user
    @prg = Project.all

	@prg.each do|p|
		if(p.id == @comment.project_id)
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
    	
    if @comment.save
	
	#-----------------------------------------------
	@invite=Invite.all
	@userd=User.all	
	@invite.each do |i|
		if(i.project_id == @comment.project_id && i.mail != @user.email )
		@userd.each do |u|	
			if(i.mail == u.email )
				@imail=i.mail
				UserMailer.comment_confirmation(@comment,@imail,@pname,@cname).deliver
			end
		end
		end
	end
	#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@userd.each do |u|
		if(@uid == u.id && u.email != @user.email)
			@imail=u.email	
			UserMailer.comment_confirmation(@comment,@imail,@pname,@cname).deliver
		end
	end
	#----------------------------------------------------
    	
	format.html {redirect_to project_path(@project)}
	format.js 
	
    else
       format.html {redirect_to project_path(@project), :flash =>   {:error => "Text field could not be empty, Comment not created ."}}
    end
   
  
  else
    format.html {redirect_to project_path(@project), :flash =>   {:error => "you are removed from this project."}}
  end
 end
end

#==========================================================
def destroy
    @comment = Comment.find(params[:id])
    @pid=@comment.project_id
    @project=Project.find_by_id(@pid)        
       respond_to do |format|
         if @comment.destroy
           format.html{redirect_to project_path(@project)}
	   format.js
         else
           format.html{redirect_to project_path(@project), :error => 'comment not deleted!'}
         end 
       end

end

end
