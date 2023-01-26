class AddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    # add_reference :likes, :author, null: false, foreign_key: true
    add_reference :likes, :author, foreign_key: { to_table: 'users' }
  end
end
