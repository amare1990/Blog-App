class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorid
      t.integer :postid
      t.text :text

      t.timestamps
      add_reference :comments, :author, references: :users, null: false, foreign_key: {to_table: :users}
    end
    add_index :comments, :authorid
    add_index :comments, :postid

  end
end
