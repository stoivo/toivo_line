class RenameSelectedByToselectedByIdInGamePlots < ActiveRecord::Migration
  def change
    rename_column :game_plots, :selected_by, :selected_by_id
  end
end
