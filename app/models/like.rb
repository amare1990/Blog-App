class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  after_save :update_likes_counter

  private

  def update_likes_counter
    counter = Like.count(:post_id)
    post.update(likes_counter: counter)
  end
end


#########
=begin
has_many :posts, foreign_key: :author_id
has_many :likes, foreign_key: :author_id
has_many :comments, foreign_key: :author_id

def three_recent_posts
  posts.order(created_at: :desc).limit(3)
end
=end
