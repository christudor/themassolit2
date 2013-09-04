source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'bootstrap-sass', '2.1'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
gem 'jquery-rails', '2.0.2'
gem 'devise', '2.1.2'
gem 'cancan', '1.6.8'
gem 'rolify', '3.2.0'

# Simple Form for form construction (for use with 
# Stripe (see below)

gem 'simple_form', '2.0.4'

# Stripe gems for credit card payments

gem 'stripe'
gem 'stripe_event'
gem 'figaro'

# Paperclip and Amazon Web Services gems for association
# of database items (e.g. users, courses, etc) with images

gem "paperclip", "~> 3.0"
gem 'aws-sdk', '~> 1.5.7'

# Carrierwave for course images.

gem 'carrierwave'
gem 'fog', '~> 1.3.1'


group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'
  gem 'spork', '0.9.2'
  gem 'better_errors', '0.2.0'
  gem 'binding_of_caller', '0.6.8'
  gem 'quiet_assets', '1.0.1'

end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.2'

group :test do
  gem 'capybara', '1.1.2'
  gem 'rb-fchange', '0.0.5'
  gem 'rb-notifu', '0.0.4'
  gem 'win32console', '1.3.0'
  gem 'factory_girl_rails', '4.1.0'
  gem 'launchy', '2.1.2'
  gem 'email_spec','1.2.1'
  gem 'database_cleaner', '0.9.1'
end 

group :production do
  gem 'pg', '0.12.2'
end