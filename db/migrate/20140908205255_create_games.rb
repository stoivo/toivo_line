class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :start_by_id
      t.integer :winner_id
      t.integer :losser_id
      t.integer :first_player_id
      t.integer :secound_player_id
      t.integer :turn, default: 0
      t.integer :weight, null: false
      t.integer :height, null: false
      t.string :mode
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
