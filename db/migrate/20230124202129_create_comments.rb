class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorid, :postid
      t.text :text

      t.timestamps

      add_index :authorid, :postid
    end
  end
end
