source 'https://rubygems.org'
ruby '2.5.1'

# Core
gem 'rails', '~> 5.1.0'
gem 'pg', '0.15.1'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder'
gem 'bcrypt' # Use ActiveModel has_secure_password

# Addons
gem 'acts_as_list'
gem 'haml'
gem 'haml-rails'
gem 'font-awesome-sass'
gem 'touchpunch-rails' # http://touchpunch.furf.com/ Touch Event Support for jQuery UI
gem 'nprogress-rails' # https://github.com/caarlos0/nprogress-rails
gem 'faker'
gem 'chartkick'
gem 'groupdate'

# Translations
gem 'it' # Tool to improve the  with links embedded https://github.com/iGEL/it
gem 'globalize', '~> 5.1.0' # Translations for databases

group :assets do
  gem 'modernizr-rails' # HTML 5 support, http://modernizr.com/
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'guard-cucumber'
  gem 'spring'
end

group :development, :test do
  gem 'sqlite3'

  gem 'rspec-rails'
  gem "spring-commands-cucumber"
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'poltergeist'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'launchy'
end
