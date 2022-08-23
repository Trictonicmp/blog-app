require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  it 'shows the username' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Lilly')
  end

  it 'displays profile picture' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_xpath("//img[@alt='Lilly']")
  end

  it 'shows numbers of posts the user has written' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Number of posts: 4')
  end

  it 'shows posts title' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('My forth post')
  end

  it 'shows posts body' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Lorem ipsum')
  end

  it 'shows the firsts comments on a post' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Liked!!')
    expect(page).to have_content('Nice to see you here!')
    expect(page).to have_content('Hi Lilly!')
  end

  it 'shows the number of comments of a post' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Comments: 3')
  end

  it 'shows the number of likes of a post' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Likes: 3')
  end

  it 'has a pagination button' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_selector(:link_or_button, 'pagination')
  end

  it 'redirects to the user/post/show page when clicking on a post' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_link('My forth post', href: '/users/1/posts/9')
  end
end
