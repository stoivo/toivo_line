class CreateGamePloys < ActiveRecord::Migration
  def change
    create_table :game_ploys do |t|
      t.integer :game_id, null: false
      t.integer :colom
      t.integer :row
      t.integer :selected_by
      t.integer :selected_turn

      t.timestamps
    end
  end
end
