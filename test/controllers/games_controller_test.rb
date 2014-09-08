require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { end_at: @game.end_at, first_player: @game.first_player, first_player: @game.first_player, height: @game.height, losser: @game.losser, mode: @game.mode, secound_player: @game.secound_player, start_at: @game.start_at, start_by: @game.start_by, turn: @game.turn, weight: @game.weight, winner: @game.winner }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { end_at: @game.end_at, first_player: @game.first_player, first_player: @game.first_player, height: @game.height, losser: @game.losser, mode: @game.mode, secound_player: @game.secound_player, start_at: @game.start_at, start_by: @game.start_by, turn: @game.turn, weight: @game.weight, winner: @game.winner }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
