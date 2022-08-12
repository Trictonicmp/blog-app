class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, class_name: 'Comment'
  has_many :likes, class_name: 'Like'
  after_save :add_post_count

  def add_post_count
    author.increment!(:post_counter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).first(5)
  end

  validates :title, presence: true, length: { in: 2...250 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
