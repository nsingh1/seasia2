class StaticpagesController < ApplicationController
  def home
  @projects = current_user.projects.build if signed_in?
  end
end
