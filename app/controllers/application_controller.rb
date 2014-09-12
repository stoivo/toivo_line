class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_extra_javascripts_files

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end



  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  private
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Pleas log in."
      redirect_to :controller => 'access', :action => 'login'
      return false
    else
      return true
    end
  end

  def set_extra_javascripts_files
    @javascript_extrafiles = []
  end
end
