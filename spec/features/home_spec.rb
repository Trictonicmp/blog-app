require 'rails_helper'

RSpec.describe 'Homepage', type: :system do
  it 'shows the names of the users' do
    visit('http://localhost:3000/')
    expect(page).to have_content('Lilly')
    expect(page).to have_content('Josh')
    expect(page).to have_content('Tom')
  end

  it 'displays image of each user' do
    visit('http://localhost:3000/')
    expect(page).to have_xpath("//img[@alt='Lilly']")
    expect(page).to have_xpath("//img[@alt='Josh']")
    expect(page).to have_xpath("//img[@alt='Tom']")
  end

  it 'shows numbers of posts of each user' do
    visit('http://localhost:3000/')
    expect(page).to have_content('Number of posts: 4')
    expect(page).to have_content('Number of posts: 0')
    expect(page).to have_content('Number of posts: 5')
  end

  it 'redirects to the user/show page' do
    visit('http://localhost:3000/')
    click_on('Lilly')
    expect(page).to have_current_path(user_path(id: 1))
  end
end
