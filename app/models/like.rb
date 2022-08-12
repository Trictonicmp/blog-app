class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :add_likes_count
  
  def add_likes_count
    post.increment!(:likes_counter)
  end

end
