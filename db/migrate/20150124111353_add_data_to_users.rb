class AddDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rep_id, :string
    add_column :users, :introduction, :string

    add_index :users, :rep_id, :unique => true
  end
end
