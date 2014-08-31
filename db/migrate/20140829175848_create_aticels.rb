class CreateAticels < ActiveRecord::Migration
  def up
    execute "create extension hstore"
    create_table :aticels do |t|
      t.string :name
      t.text :content
      t.date :published_on
      t.string :tags, array: true
      t.hstore :properties

      t.timestamps
    end
  end
  def down
    drop_table :aticels
    execute 'DROP EXTENSION hstore'
  end
end
