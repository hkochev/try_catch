# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
admin = User.create! email: 'test@test.com', password: 'testpass', role: :admin
user = User.create! email: 'test1@test.com', password: 'testpass', role: :user
guest = User.create! email: 'test2@test.com', password: 'testpass', role: :guest

[admin, user, guest].each { |user| TaskList.create! title: "#{user.role} task", user: user }
