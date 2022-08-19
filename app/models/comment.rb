class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :add_comment_count

  def add_comment_count
    post.increment!(:comments_counter)
  end
end
