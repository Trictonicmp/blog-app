require 'rails_helper'

describe User, type: :model do
  user { 
    User.new(
      name: 'Amaury Elohir Pérez Merino',
      photo: 'www.google.com',
      bio: 'Full Stack Developer'
    )
  }

  before { user.save }

  describe 'Name shoild be set' do
    user.name = nil
    expect(user).not_to_be_valid
  end
end