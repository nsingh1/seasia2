class UserMailer < ActionMailer::Base
  default :from => "B2B (Business To Business)"

def password_reset(user)
  @user = user
  mail :to => user.email, :subject => "Password Reset"
end
def verify_token(user)
  @user = user
  @tok= @user.verify_token
@url ="http://203.100.79.149:3000/verifys/"+@tok+"/edit"
  mail :to => user.email, :subject => "Verify Email"
end
	def user_confirmation(user,email)
        @user  = user
        @email = email
        @url ="http://203.100.79.149:3000/projects"
                mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome")
        end

       def registration_confirmation(invite,user,project)
        @invite = invite
        @user=user
        @project=project
		@url ="http://203.100.79.149:3000/projects"
                mail(:to => "#{invite.name} <#{invite.mail}>", :subject => "Invitation")
        end
#-----------------------------------------------------------------
        def comment_confirmation(comment,imail,pname,cname)
        @comment = comment
	@pname=pname
	@imail = imail
                mail(:to => "#{imail}", :subject => "new comment created",
	 :body => "
	Project Name => #{pname}
	Company Name => #{cname}
	 => #{comment.content}
	************************
	" )
        end

#-----------------------------------------------------------------
        def micropost_confirmation(micropost,imail,pname,cname)
	
	@micropost = micropost
	@pname=pname
	@imail = imail
                mail(:to => "#{imail}", :subject => "new Micropost created", :body => "
Project Name => #{pname}
Company Name => #{cname}
content => #{micropost.content}
************************	
")		
	end

#-----------------------------------------------------------------
        def password_confirmation(imail,passwd)
	
	@imail = imail
	@passwd = passwd
                mail(:to => "#{imail}", :subject => "new password generated", :body => "new password => #{passwd}

************************	
")		
	end


def delete_user(imail,pro,us)
	
	@imail = imail
	
@pro = pro
@us = us
@url ="http://203.100.79.149:3000/projects"
     mail(:to => "#{imail}",
	 :body => "
   you are deleted from '#{pro}' project by #{us}
   From our site #{@url}")		
end








	
end
