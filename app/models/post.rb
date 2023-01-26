class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  after_save :update_posts_counter_for_user

  def update_posts_counter_for_user
    counter = Post.count('author_id')
    author.update(posts_counter: counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
