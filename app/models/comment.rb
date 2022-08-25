class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :add_comment_count
  after_destroy :decrement_comment_counter

  def add_comment_count
    post.increment!(:comments_counter)
  end

  def decrement_comment_counter
    post.decrement!(:comments_counter)
  end
end
