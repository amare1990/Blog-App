class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authorid
      t.integer :postid

      t.timestamps
      add_reference :likes, :author, references: :users, null: false, foreign_key: {to_table: :users}
    end
    add_index :likes, :authorid
    add_index :likes, :postid

  end
end
