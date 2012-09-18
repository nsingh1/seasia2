class VerifysController < ApplicationController
  def edit
  @user = User.find_by_verify_token!(params[:id])
end

def update
  @user = User.find_by_verify_token!(params[:id])
  if @user.verify_sent_at < 2.hours.ago
    redirect_to root_path, :flash =>   {:alert => "Verification  expired."}
  elsif @user.update_attributes(params[:user])
    @user.verify =1
    if @user.save
    redirect_to root_url, :flash =>   {:notice => "Verification  done !"}
    else
    redirect_to root_url, :flash =>   {:notice => "Verification not  done !"}
    end
  else
    render :edit
  end
end
end
