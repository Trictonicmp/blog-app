require 'rails_helper'

RSpec.describe 'Homepage', type: :system do  
  it 'shows the names of the users' do
    visit('http://localhost:3000/')
    expect(page).to have_content('Lilly') 
    expect(page).to have_content('Josh') 
  end
end