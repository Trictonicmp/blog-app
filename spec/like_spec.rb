require 'rails_helper'

describe Like, type: :model do
  let(:author) { User.new(name: 'amaury', photo: 'google.com', bio: 'FSD') }
  let(:post) { Post.new(author:, title: 'Hello', text: 'hello2') }
  let(:like) { Like.new(author:, post:) }

  before do
    author.save
    post.save
    like.save
  end

  describe 'giving a like updates counter' do
    it 'should add 1 to comments_counter' do
      expect(post.likes_counter).to eql(1)
    end
  end
end