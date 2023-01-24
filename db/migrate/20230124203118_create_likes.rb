class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authorid
      t.integer :postid
      t.timestamps

      add_index :authorid, :postid
    end
  end
end
