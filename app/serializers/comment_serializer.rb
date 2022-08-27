class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :author_id, :post_id
  belongs_to :post
end
