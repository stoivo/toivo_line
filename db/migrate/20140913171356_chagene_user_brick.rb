class ChageneUserBrick < ActiveRecord::Migration
  def change
    rename_column :users, :default_brick, :default_play_brick_id
  end
end
