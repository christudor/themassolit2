# Assign an new random password for each user and send them a email notification
# path: lib/tasks/devise.rake

namespace :devise do
  desc 'Mass password reset and send email instructions'
  task :mass_password_reset => :environment do
    begin
      User.all do |u|
        # Assign a random password
        random_password = Devise.friendly_token.first(8)
        u.password = random_password
        u.save
        # Send change notification (Ensure you have created #{model}Mailer e.g. UserMailer)
        UserMailer.password_reset(u, random_password).deliver  
      end
    rescue Exception => e
      puts "Error: #{e.message}"
    end
  end
end