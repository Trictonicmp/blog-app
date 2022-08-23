require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  it 'shows the username' do
    visit('http://localhost:3000/users/136/posts')
    expect(page).to have_content('Lilly')
  end
  
  it 'displays profile picture' do
    visit('http://localhost:3000/users/136/posts')
    expect(page).to have_xpath("//img[@alt='Lilly']")
  end
  
  it 'shows numbers of posts the user has written' do
    visit('http://localhost:3000/users/136/posts')
    expect(page).to have_content("Number of posts: 4")
  end
  
  it 'shows posts title' do
    visit('http://localhost:3000/users/136/posts')
    expect(page).to have_content('My forth post')
  end
  
  it 'shows posts body' do
    visit('http://localhost:3000/users/136/posts')
    expect(page).to have_content('Lorem ipsum')
  end
  
  it 'shows the firsts comments on a post' do
    visit('http://localhost:3000/users/136/posts')
    expect(page).to have_content('this is my sixth comment six')
    expect(page).to have_content('this is my fifth comment five')
    expect(page).to have_content('this is my fourth comment four')
    expect(page).to have_content('this is my third comment three')
    expect(page).to have_content('Hey you!')
  end
  
  it 'shows the number of comments of a post' do
    visit('http://localhost:3000/users/136/posts')
    expect(page).to have_content('Comments: 11')
  end
  
  it 'shows the number of comments of a post' do
    visit('http://localhost:3000/users/136/posts')
    expect(page).to have_content('Likes: 2')
  end
  
  it 'has a pagination button' do
    visit('http://localhost:3000/users/136/posts')
    expect(page).to have_selector(:link_or_button, 'pagination')
  end

  it 'redirects to the user/post/show page when clicking on a post' do
    visit('http://localhost:3000/users/136')
    expect(page).to have_link('My forth post', href: '/users/136/posts/140')
  end
end
