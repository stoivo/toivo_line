class RenamePloysToPlotsAndSomeSmallThonks < ActiveRecord::Migration
  def up
    rename_column :game_plots, :column, :vertical
    rename_column :game_plots, :row, :horizontal
  end
  def down
    rename_column :game_plots, :horizontal, :row
    rename_column :game_plots, :vertical, :column
  end
end
