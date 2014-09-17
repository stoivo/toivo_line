class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @javascript_extrafiles << "login"
    @user = User.new
    @show_to_all_bricks = PlayBrick.where(show_to_all: true)
  end

  # GET /users/1/edit
  def edit
    @javascript_extrafiles << "login"
    
    # @user = current_user
    @show_to_all_bricks = PlayBrick.where(show_to_all: true)
    @added_by_user = @user.added_play_bricks
    #.where(show_to_all: false)

  end


  # POST /users
  # POST /users.json
  def create
    debugger
    if user_params.has_key? :play_bricks
      p = PlayBrick.create name: user_params["play_bricks"][:image].original_filename,
                           show_to_all: false,
                           image: user_params["play_bricks"][:image]
    end
    user_params.merge({default_play_brick_id: p.id})
    @user = User.new(user_params.reject{ |k,v| k == "play_bricks" })

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
    debugger
    if user_params.has_key? :play_bricks
      p = PlayBrick.create name: user_params["play_bricks"][:image].original_filename,
                           show_to_all: false,
                           image: user_params["play_bricks"][:image]
    end
    user_params.merge({default_play_brick_id: p.id})
    @user = User.new(user_params.reject{ |k,v| k == "play_bricks" })

    respond_to do |format|
      if @user.update(user_params)
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
    debugger
    params.require(:user).permit(:username, :epost, :password, :default_play_brick_id, play_bricks: [:_destroy, :image ])
  end
end

