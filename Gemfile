source "https://rubygems.org"
ruby "2.3.0"
gem "rails", "4.2.5.2"
gem "sass-rails", "~> 5.0"
gem "rails-i18n"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "turbolinks"
gem "jbuilder", "~> 2.0"
gem "has_secure_token"
gem "bootstrap-sass"
gem "devise"
gem "cancancan"
gem "high_voltage"
gem "sendgrid"
gem "font-awesome-rails"
gem "simple_form"
gem "chosen-rails"
gem "trix"
gem "nprogress-rails"
gem "kaminari"
gem "searchkick"
gem "friendly_id", "~> 5.1.0"
gem "sidekiq"
gem "sinatra", require: nil
gem "puma"
gem "newrelic_rpm"
gem "rubocop", require: false

group :development do
  gem "web-console", "~> 2.0"
  gem "spring"
  gem "better_errors"
  gem "quiet_assets"
  gem "rails_layout"
  gem "spring-commands-rspec"
  gem "pry-rails"
  gem "terminal-notifier-guard"
end

group :test, :darwin do
  gem "rb-fsevent"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "faker"
  gem "rspec-rails"
  gem "sqlite3"
  gem "dotenv-rails"
  gem "byebug"
end

group :production do
  gem "pg"
  gem "rails_12factor"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
  gem "guard-rspec"
  gem "codeclimate-test-reporter", require: nil
end
