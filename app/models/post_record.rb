class Post < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, class_name: 'Comment', foreign_key: :post_id
  has_many :likes, class_name: 'Like', foreign_key: :post_id

  after_save :update_posts_counter_for_user


  def update_posts_counter_for_user
    counter = Post.count('author_id')
    author.update(counter)
  end
end
