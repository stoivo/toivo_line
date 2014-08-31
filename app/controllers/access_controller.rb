class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    @current_user = current_user
    # display text & links
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first || User.where( :epost => params[:username]).first
      if found_user
        @current_user = found_user.authenticate(params[:password])
      end
    end
    if @current_user
      session[:user_id] = @current_user.id
      session[:username] = @current_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

end
