class AddGoodsToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :title, :string
    add_column :microposts, :key, :string
    add_column :microposts, :category, :string
    add_column :microposts, :whole_price, :integer
    add_column :microposts, :shipping_cost, :integer
    add_column :microposts, :short_desc, :text
    add_column :microposts, :desc, :text
    add_column :microposts, :rep_short_desc, :text
    add_column :microposts, :rep_desc, :text

    add_index :microposts, :key, unique: true
    add_index :microposts, :category
  end
end
