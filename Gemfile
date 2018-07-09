source 'https://rubygems.org'
ruby '2.5.1'

# Core
gem 'rails', '4.2.10'
gem 'sqlite3'
gem 'pg', '0.15.1'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 1.2'
gem 'bcrypt-ruby', '3.1.2' # Use ActiveModel has_secure_password


# Addons
gem 'acts_as_list'
gem 'haml', '~> 4.0.3'
gem 'haml-rails', '~> 0.4'
gem 'font-awesome-sass', '~> 4.3.0'
gem 'touchpunch-rails' # http://touchpunch.furf.com/ Touch Event Support for jQuery UI
gem 'nprogress-rails' # https://github.com/caarlos0/nprogress-rails
gem 'faker'
gem 'chartkick'
gem 'groupdate'

# https://github.com/igor-alexandrov/wiselinks
# to add wiselinks to a link, you have to give it a data attribute of push set to true, like so:
# <% link_to "Home", root_path, data: { push: true } %>
gem 'wiselinks'

# Translations
gem 'it' # Tool to improve the  with links embedded https://github.com/iGEL/it
gem 'globalize', '~> 4.0.2' # Translations for databases

group :assets do
  # HTML 5 support, http://modernizr.com/
  gem "modernizr-rails", "~> 2.6.2.3"
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'guard-cucumber'
  gem 'spring'
end

group :development, :test do
  gem 'rspec-rails'
  gem "spring-commands-cucumber"
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara', '~> 2.3.0'
  gem 'poltergeist'
  gem 'cucumber-rails', '~> 1.4.1', :require => false
  gem 'database_cleaner'
  gem 'launchy', '~> 2.4.2'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end
