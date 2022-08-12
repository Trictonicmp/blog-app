class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def add_comment_count
    post.increment!(:likes_counter)
  end

  after_save :add_comment_count
end
