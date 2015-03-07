class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.string :password_digest
      t.string :remember_token
      t.boolean :admin, :default => false

      t.string :rep_id
      t.text :introduction

      t.timestamps
    end

  	add_index :users, :email, unique: true
  	add_index :users, :remember_token
    add_index :users, :rep_id, :unique => true

  end
end

