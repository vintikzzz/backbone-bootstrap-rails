# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

u = User.new
u.email = "test@test.test"
u.password = "123456"
u.roles << :admin
u.save!
