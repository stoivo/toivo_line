class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @plots = @game.plots.order("vertical asc").order("horizontal asc")

    @plots_2D = []
    (0..@game.rows).each do |row_int| 
      @plots_2D << []
      (0..@game.columns).each do |column_int| 
        debugger
        @plots_2D[row_int] << @game.plots.where(horizontal: row_int, vertical: column_int)
        
      end
    end
    (0..@game.rows).each do |row_int| 
      puts row_int
    end
    [1, 4, 5, 7, 10, 12].each_index do |i|
      puts i
    end
    # lag en 2D array 
    # [
    #   [row1 colom1,row1 colom2,row1 colom3],
    #   [row2 colom1,row2 colom2,row2 colom3],
    #   [row3 colom1,row3 colom2,row3 colom3]
    # ]
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # One new user join
  def join game_id
      # update
      # :first_player
      # :secound_player
      # :start_at
    # and start game
  end
  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params.merge("started_by_id" => current_user))

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit( :columns, :rows, :mode)
      # :start_by

      # :mode
      # :winner
      # :losser
      # :turn
      # :first_player
      # :secound_player
      # :start_at
      # :end_at



    end
end
