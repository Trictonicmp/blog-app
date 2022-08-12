require 'rails_helper'

describe Post, type: :model do
  let(:author) { User.create!(name: 'amaury', photo: 'www.google.com', bio: 'magician') }
  let(:post) { Post.create!(author:, title: 'hello', text: 'hello2') }

  describe 'title should be present' do
    it 'thus its not valid' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'has a valid title' do
      post.title = 'A great title'
      expect(post).to be_valid
    end
  end
end