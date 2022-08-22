require 'rails_helper'

RSpec.describe User, type: :model do
  let(:author) do
    User.new(
      name: 'Amaury Elohir Pérez Merino',
      photo: 'www.google.com',
      bio: 'Full Stack Developer',
      post_counter: 1
    )
  end

  before { author.save }

  describe 'User validations: ' do
    it 'Name should be set thus not be valid' do
      author.name = nil
      expect(author).to_not be_valid
    end

    it 'Name should be more than 1 letter thus not be valid' do
      author.name = 'a'
      expect(author).to_not be_valid
    end

    it 'Post counter should be a number' do
      author.post_counter = 'a'
      expect(author).to_not be_valid
    end

    it 'Post counter should be equal or greater than 0' do
      author.post_counter = -1
    end

    it 'Name should be changed to "Mario"' do
      author.name = 'Mario'
      name = author.name
      expect(name).to eql('Mario')
    end
  end
end
