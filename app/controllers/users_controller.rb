class UsersController < ApplicationController
before_filter :signed_in_user, :only=> [ :edit, :update, :show]
  def show
   
   @user = User.find_by_name(params[:id])
if @user
@abc=Project.all
@invite=Invite.all
@xyz=Comment.all.reverse
@project = Project.all
@projects = @user.projects(:page => params[:page])	
else
(render :file => "#{Rails.root}/public/422.html", :status => 422, :layout => false)
end	
 end

def new
   @user = User.new
  end
 def create
    @user = User.new(params[:user])
    @user.verify =0
   
   
    if @user.save
     UserMailer.user_confirmation(@user,@email).deliver
user = User.find_by_email(@user.email)
   user.verify_user if user
     sign_in @user
       
       redirect_to projects_path,:flash =>   {:notice => "Welcome ..........."}
    else
      render 'new'
    end
  end


def edit

    @user = User.find_by_name(params[:id])

  end
def update
    @user = User.find_by_name(params[:id])
    if @user.update_attributes(params[:user])
      
      sign_in @user
      redirect_to projects_path,:flash =>   {:notice => "Profile updated"}
    else
      @title = "edit_user"
      redirect_to projects_path,:flash =>   {:error=> "Profile not updated"}
    end
  end
  
def notification

end

end
