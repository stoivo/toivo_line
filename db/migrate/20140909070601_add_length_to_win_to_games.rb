class AddLengthToWinToGames < ActiveRecord::Migration
  def change
    add_column :games, :length_to_win, :integer
    rename_column :game_ploys, :colom, :column
  end
end
