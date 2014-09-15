class CreatePlayBricks < ActiveRecord::Migration
  def change
    
    create_table :play_bricks do |t|
      t.string :name
      t.references :added_by, index: true
      t.boolean :show_to_all, default: false

      t.timestamps
    end
  end
end
