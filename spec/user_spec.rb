require 'rails_helper'

describe User, type: :model do
  subject { 
    User.new(
      name: 'Amaury Elohir Pérez Merino',
      photo: 'www.google.com',
      bio: 'Full Stack Developer'
    )
  }

  before { subject.save }

  it 'Name should be set' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end