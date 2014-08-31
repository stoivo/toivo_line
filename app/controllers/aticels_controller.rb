class AticelsController < ApplicationController
  before_action :set_aticel, only: [:show, :edit, :update, :destroy]

  # GET /aticels
  # GET /aticels.json
  def index
    @aticels = Aticel.all
  end

  # GET /aticels/1
  # GET /aticels/1.json
  def show
  end

  # GET /aticels/new
  def new
    @aticel = Aticel.new
  end

  # GET /aticels/1/edit
  def edit
  end

  # POST /aticels
  # POST /aticels.json
  def create
    @aticel = Aticel.new(aticel_params)

    respond_to do |format|
      if @aticel.save
        format.html { redirect_to @aticel, notice: 'Aticel was successfully created.' }
        format.json { render :show, status: :created, location: @aticel }
      else
        format.html { render :new }
        format.json { render json: @aticel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aticels/1
  # PATCH/PUT /aticels/1.json
  def update
    respond_to do |format|
      if @aticel.update(aticel_params)
        format.html { redirect_to @aticel, notice: 'Aticel was successfully updated.' }
        format.json { render :show, status: :ok, location: @aticel }
      else
        format.html { render :edit }
        format.json { render json: @aticel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aticels/1
  # DELETE /aticels/1.json
  def destroy
    @aticel.destroy
    respond_to do |format|
      format.html { redirect_to aticels_url, notice: 'Aticel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aticel
      @aticel = Aticel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aticel_params
      # debugger
      # params.require(:aticel).permit(:name, :content, :published_on, :tags, :properties)
      params.require(:aticel).permit(:name, :content, :published_on, :properties, tags: [])
    end
end
