# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

u = User.new
u.email = "admin@test.test"
u.password = "123456"
u.roles << :admin
u.save!
u.confirm!

u = User.new
u.email = "user@test.test"
u.password = "123456"
u.roles << :user
u.save!
u.confirm!

(1..30).each do |e|
  p = Post.new
  p.title = "Title #{e}"
  p.content = "Content #{e}"
  p.user = u
  p.save!
end
