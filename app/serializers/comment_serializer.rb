class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user_id, :post_id
  belongs_to :post
end
