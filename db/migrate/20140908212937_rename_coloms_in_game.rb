class RenameColomsInGame < ActiveRecord::Migration
  def up
    rename_column :games, :start_by_id, :started_by_id
  end
  def down
    rename_column :games, :started_by_id, :start_by_id
  end
end
