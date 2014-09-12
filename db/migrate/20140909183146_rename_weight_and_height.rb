class RenameWeightAndHeight < ActiveRecord::Migration
  def change
    rename_column :games, :height, :columns
    rename_column :games, :weight, :rows
  end
end
