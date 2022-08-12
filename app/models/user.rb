class User < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'

  def three_most_recent_post
    posts.order(created_at: :desc).first(3)
  end

  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true, length: { in: 2...25 }
end
