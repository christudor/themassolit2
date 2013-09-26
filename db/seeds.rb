puts 'PROFILES'
YAML.load(ENV['PROFILES']).each do |profile|
  Profile.find_or_create_by_name({ :name => profile }, :without_protection => true)
  puts 'Profile: ' << profile
end

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'Role: ' << role
end

puts 'DEFAULT USERS'
subscriber = Subscriber.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'Subscriber: ' << subscriber.name
subscriber.add_role :admin
subscriber2 = Subscriber.find_or_create_by_email :name => 'Second Subscriber', :email => 'user2@example.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'Subscriber: ' << subscriber2.name
subscriber2.add_role :validteacher
subscriber3 = Subscriber.find_or_create_by_email :name => 'Third Subscriber', :email => 'user3@example.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'Subscriber: ' << subscriber3.name
subscriber3.add_role :validstudent