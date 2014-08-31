class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :username, :limit => 26
      t.string :epost, :limit => 100 , :default => "", :null =>false
      t.string :password_digest

      # t.string :encrypted_password 
      # t.string :salt

      t.string :user_photo
      t.integer :default_brick 
      t.date :first_login 
      t.date :last_login 

      t.timestamps
    end
    add_index :users, :username
  end
end
