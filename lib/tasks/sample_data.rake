namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_courses
    make_lessons
    make_providers
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
      name = "Economics 10#{n+1}"
      category = "Economics"
      description = "A closer look at Adam Smith's Wealth of Nations"
      Course.create!(name:  name, category: category, description: description, provider_id: n+1)
    end
  end

  def make_lessons
    10.times do |n|
      title = "Lecture #{n+1}"
      description = "This lecture will be a really important part of your learning"
      Course.create!(title: title, description: description, length: "15:00")
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
    course = courses.first
    students = users[1..10]
    students.each { |student| student.study!(course) }
  end