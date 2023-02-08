class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  after_save :update_comments_counter

  validates :text, presence: true

  private

  def update_comments_counter
    # counter = Comment.count('post_id')
    # post.update(comments_counter: counter)
    post.update(comments_counter: post.comments.count)
  end
end
