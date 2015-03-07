class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.integer :user_id

      t.string :title
      t.string :category
      t.text :short_desc
      t.text :desc
      t.text :rep_short_desc
      t.text :rep_desc

      t.integer :goods_seq
      t.string :maker
      t.string :pic_url

      t.timestamps
    end

    add_index :microposts, :goods_seq
    add_index :microposts, [:maker, :goods_seq]

  end
end


