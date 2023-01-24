class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorid
      t.string :title
      t.text :text
      t.integer :commentscounter
      t.integer :likescounter
      t.timestamps

      add_index :authorid

      add_reference :post, :comment, index: true, foreign_key: true
      add_reference :post, :like, index: true, foreign_key: true
    end
  end
end
