# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# --------------------- users ---------------------
lilly = User.create(name: ' Lilly', photo: 'https://t4.ftcdn.net/jpg/03/30/25/97/360_F_330259751_tGPEAq5F5bjxkkliGrb97X2HhtXBDc9x.jpg', bio: 'Teacher from Poland.
Passionated about surfing and traveling around the world, I can say that "Travel" is my second name!')
tom = User.create(name: 'Tom', photo: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', bio: 'Vet. medic from Colombia and software developer
Switching career has been the most exciting thing I\'ve ever done and the most rewarding too, glad to be here with lots of friends from all around the world.')
josh = User.create(name: 'Josh', photo: 'https://i.pinimg.com/originals/b0/05/e4/b005e4074bd5505f95dc2c2da1135d1c.jpg', bio: 'A good grandpa')

# --------------------- posts ---------------------
post1 = Post.create(author: tom, title: 'Hello', text: 'This is my first post')
post2 = Post.create(author: tom, title: 'Hello second first', text: 'This is my second post')
post3 = Post.create(author: tom, title: 'My new post from form', text: 'This is a new post 1 from form')
post4 = Post.create(author: tom, title: 'My second post from form', text: 'This is my second post from form')
post5 = Post.create(author: tom, title: 'My life as a programmer', text: 'Ever since I started in programmin...')

post6 = Post.create(author: lilly, title: 'My first post', text: 'This is my first post')
post7 = Post.create(author: lilly, title: 'My second post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
post8 = Post.create(author: lilly, title: 'My third post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
post9 = Post.create(author: lilly, title: 'My forth post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

# --------------------- comments ---------------------
Comment.create(post: post1, author: lilly, text: 'Hi Tom!')
Comment.create(post: post1, author: lilly, text: 'Nice to read about you')
Comment.create(post: post1, author: josh, text: 'I liked your post!')
Comment.create(post: post6, author: tom, text: 'Hi Lilly!')
Comment.create(post: post6, author: tom, text: 'Nice to see you here!')
Comment.create(post: post6, author: josh, text: 'Liked!!')

# --------------------- likes ---------------------
Like.create(author: lilly, post: post1)
Like.create(author: tom, post: post1)
Like.create(author: josh, post: post1)

Like.create(author: lilly, post: post6)
Like.create(author: tom, post: post6)
Like.create(author: josh, post: post6)