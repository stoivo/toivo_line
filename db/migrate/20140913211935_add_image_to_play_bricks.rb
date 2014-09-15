class AddImageToPlayBricks < ActiveRecord::Migration
  def change
    add_column :play_bricks, :image, :string
  end
end
