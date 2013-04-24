namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_courses
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_courses
  99.times do |n|
    name = Faker::Name.name
    category = "Example Category-#{n+1}"
    description = "Example Description#{n+1}"
    Course.create!(name:  name, category: category, description: description, provider_id: n)
  end
end

def make_providers
  99.times do |n|
    name = Faker::Name.name
    Provider.create!(name:  name)
  end
end

def make_relationships
  users = User.all
  courses = Course.all
  user  = users.first
  course = courses.first
  courses_taken = courses[2..50]
  students      = users[3..40]
  courses_taken.each { |course| user.study!(course) }
  students.each      { |student| student.study!(course) }
end