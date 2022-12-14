require 'rails_helper'

RSpec.describe 'Users', type: :system do
  it 'shows the username' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Lilly')
  end

  it 'displays profile picture' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_xpath("//img[@alt='Lilly']")
  end

  it 'shows numbers of posts the user has written' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Number of posts: 4')
  end

  it 'shows the user\'s bio' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Teacher from Poland')
  end

  it 'shows the user\'s first 3 posts' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('My forth post')
    expect(page).to have_content('My third post')
    expect(page).to have_content('My second post')
  end

  it 'has a "See all posts" button' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_selector(:link_or_button, 'See all posts')
  end

  it 'redirects to the user/post/show page when clicking on a post' do
    visit('http://localhost:3000/users/1')
    click_on('My forth post')
    expect(page).to have_current_path(user_post_path(user_id: 1, id: 9))
  end

  it 'redirects to users/posts index when clicking in "See all posts"' do
    visit('http://localhost:3000/users/1')
    click_button('See all posts')
    expect(page).to have_current_path(user_posts_path(user_id: 1))
  end
end
