class UsersController < ApplicationController
  def new
    @javascript_extrafiles << "login"

    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to :controller => "access", :action => "index", notice: 'user was successfully created.' }
        format.json { render :login, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :epost, :password)
  end

end
