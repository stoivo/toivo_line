json.array!(@games) do |game|
  json.extract! game, :id, :start_by, :weight, :height, :winner, :losser, :turn, :first_player, :secound_player, :first_player, :start_at, :end_at, :mode
  json.url game_url(game, format: :json)
end
