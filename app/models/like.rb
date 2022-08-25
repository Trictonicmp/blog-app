class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :add_likes_count
  after_destroy :reduce_likes_count

  def add_likes_count
    post.increment!(:likes_counter)
  end

  def reduce_likes_count
    post.decrement!(:likes_counter)
  end
end
