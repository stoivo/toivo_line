class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @javascript_extrafiles << "nested_form"
  end

  def show
    @show_to_all_bricks = PlayBrick.where(show_to_all: true)
  end

  # GET /users/new
  def new
    @javascript_extrafiles << "login"
    @javascript_extrafiles << "nested_form"
    @user = User.new
    @show_to_all_bricks = PlayBrick.where(show_to_all: true)
  end

  # GET /users/1/edit
  def edit
    @javascript_extrafiles << "login"
    @javascript_extrafiles << "nested_form"
    
    # @user = current_user
    @show_to_all_bricks = PlayBrick.where(show_to_all: true)
    @added_by_user = @user.added_play_bricks
    #.where(show_to_all: false)

  end


  # POST /users
  # POST /users.json
  def create
    # Wait to continu on nested form
    
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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # Wait to continu on nested form

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :id, :username, :epost, :password, :default_play_brick_id,
      added_play_bricks_attributes: [:id, :name, :_destroy, :image ])

    # params.require(:user).permit(:username, :epost, :password, :default_play_brick_id, play_bricks: [:_destroy, :image ])
  end
end

