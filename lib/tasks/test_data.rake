namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end

def make_users
  admin = Account.create!(name: "LiuQinan",
                       email: "lqn831@gmail.com",
                       password: "111111",
                       password_confirmation: "111111",
                       role: 'admin')
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@gmail.com"
    password  = "password"
    Account.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password,
                 role: 'comment')
  end
end